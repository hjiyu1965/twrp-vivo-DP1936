#!/system/bin/sh

# 设备管理脚本
# 负责检测设备连接状态、统计设备数量并更新数据库

# 配置参数
DB_PATH="/data/system/device_manager.db"
LOG_FILE="/data/system/device_manager.log"

# 确保目录存在
mkdir -p /data/system

# 初始化数据库
init_db() {
    if [ ! -f "$DB_PATH" ]; then
        echo "初始化设备管理数据库..."
        # 创建简单的数据库文件
        echo "# 设备管理数据库" > $DB_PATH
        echo "# 格式: 时间戳,在线设备数,离线设备数,总设备数" >> $DB_PATH
    fi
}

# 检测设备连接状态
detect_devices() {
    echo "检测设备连接状态..."
    
    # 初始化计数器
    ONLINE_COUNT=0
    OFFLINE_COUNT=0
    
    # 检测USB设备
    if [ -d "/sys/bus/usb/devices" ]; then
        USB_DEVICES=$(ls -1 /sys/bus/usb/devices/ 2>/dev/null | wc -l)
        if [ "$USB_DEVICES" -gt 0 ]; then
            ONLINE_COUNT=$((ONLINE_COUNT + 1))
            echo "发现USB设备: $USB_DEVICES"
        else
            OFFLINE_COUNT=$((OFFLINE_COUNT + 1))
            echo "未发现USB设备"
        fi
    fi
    
    # 检测存储设备
    STORAGE_DEVICES=$(ls -1 /dev/block/* 2>/dev/null | grep -E "sd|mmc|usb" | wc -l)
    if [ "$STORAGE_DEVICES" -gt 0 ]; then
        ONLINE_COUNT=$((ONLINE_COUNT + 1))
        echo "发现存储设备: $STORAGE_DEVICES"
    else
        OFFLINE_COUNT=$((OFFLINE_COUNT + 1))
        echo "未发现存储设备"
    fi
    
    # 检测网络设备
    NETWORK_DEVICES=$(ls -1 /sys/class/net/ 2>/dev/null | grep -v "lo" | wc -l)
    if [ "$NETWORK_DEVICES" -gt 0 ]; then
        ONLINE_COUNT=$((ONLINE_COUNT + 1))
        echo "发现网络设备: $NETWORK_DEVICES"
    else
        OFFLINE_COUNT=$((OFFLINE_COUNT + 1))
        echo "未发现网络设备"
    fi
    
    # 计算总设备数
    TOTAL_COUNT=$((ONLINE_COUNT + OFFLINE_COUNT))
    
    echo "在线设备数: $ONLINE_COUNT"
    echo "离线设备数: $OFFLINE_COUNT"
    echo "总设备数: $TOTAL_COUNT"
    
    # 返回设备状态
    echo "$ONLINE_COUNT $OFFLINE_COUNT $TOTAL_COUNT"
}

# 更新数据库
update_db() {
    ONLINE_COUNT=$1
    OFFLINE_COUNT=$2
    TOTAL_COUNT=$3
    
    # 获取当前时间戳
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    # 记录到数据库
    echo "$TIMESTAMP,$ONLINE_COUNT,$OFFLINE_COUNT,$TOTAL_COUNT" >> $DB_PATH
    
    # 记录到日志
    echo "[$TIMESTAMP] 设备状态更新: 在线=$ONLINE_COUNT, 离线=$OFFLINE_COUNT, 总计=$TOTAL_COUNT" >> $LOG_FILE
    
    echo "数据库更新完成"
}

# 同步数据到前端
sync_to_frontend() {
    ONLINE_COUNT=$1
    OFFLINE_COUNT=$2
    TOTAL_COUNT=$3
    
    # 在TWRP中，我们可以通过设置属性或创建配置文件来与前端交互
    setprop device.manager.online $ONLINE_COUNT
    setprop device.manager.offline $OFFLINE_COUNT
    setprop device.manager.total $TOTAL_COUNT
    
    # 创建前端配置文件
    echo "ONLINE=$ONLINE_COUNT" > /data/system/device_status.txt
    echo "OFFLINE=$OFFLINE_COUNT" >> /data/system/device_status.txt
    echo "TOTAL=$TOTAL_COUNT" >> /data/system/device_status.txt
    
    echo "数据同步到前端完成"
}

# 验证数据准确性
verify_data() {
    ONLINE_COUNT=$1
    OFFLINE_COUNT=$2
    TOTAL_COUNT=$3
    
    # 验证计数逻辑
    if [ $((ONLINE_COUNT + OFFLINE_COUNT)) -eq $TOTAL_COUNT ]; then
        echo "数据验证通过: 计数逻辑正确"
        return 0
    else
        echo "数据验证失败: 计数逻辑错误"
        return 1
    fi
}

# 主函数
main() {
    echo "开始设备管理..."
    
    # 初始化数据库
    init_db
    
    # 检测设备状态
    DEVICE_STATUS=$(detect_devices)
    ONLINE_COUNT=$(echo $DEVICE_STATUS | cut -d' ' -f1)
    OFFLINE_COUNT=$(echo $DEVICE_STATUS | cut -d' ' -f2)
    TOTAL_COUNT=$(echo $DEVICE_STATUS | cut -d' ' -f3)
    
    # 验证数据
    verify_data $ONLINE_COUNT $OFFLINE_COUNT $TOTAL_COUNT
    
    # 更新数据库
    update_db $ONLINE_COUNT $OFFLINE_COUNT $TOTAL_COUNT
    
    # 同步到前端
    sync_to_frontend $ONLINE_COUNT $OFFLINE_COUNT $TOTAL_COUNT
    
    echo "设备管理完成"
}

# 执行主函数
main

exit 0