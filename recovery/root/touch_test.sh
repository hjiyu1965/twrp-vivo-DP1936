#!/system/bin/sh
# Touchscreen Response Accuracy Test Script for TWRP
# This script tests touchscreen functionality and response accuracy

LOG_TAG="touch_test"
log -t $LOG_TAG "Starting touchscreen response accuracy test"

# Test counter
TEST_COUNT=0
PASS_COUNT=0
FAIL_COUNT=0

# Function to log test results
log_result() {
    TEST_COUNT=$((TEST_COUNT + 1))
    if [ "$1" = "PASS" ]; then
        PASS_COUNT=$((PASS_COUNT + 1))
        log -t $LOG_TAG "Test $TEST_COUNT: PASS - $2"
    else
        FAIL_COUNT=$((FAIL_COUNT + 1))
        log -t $LOG_TAG "Test $TEST_COUNT: FAIL - $2"
    fi
}

# Test 1: Check vts_app_recovery service status
log -t $LOG_TAG "Test 1: Checking vts_app_recovery service status..."
VTS_STATUS=$(getprop vts_app_recovery.status)
if [ "$VTS_STATUS" = "running" ]; then
    log_result "PASS" "vts_app_recovery service is running"
else
    log_result "FAIL" "vts_app_recovery service is not running (status: $VTS_STATUS)"
fi

# Test 2: Check vts_app_recovery process
log -t $LOG_TAG "Test 2: Checking vts_app_recovery process..."
if pgrep -x vts_app_recovery > /dev/null; then
    log_result "PASS" "vts_app_recovery process is running"
else
    log_result "FAIL" "vts_app_recovery process is not running"
fi

# Test 3: Check touchscreen device nodes
log -t $LOG_TAG "Test 3: Checking touchscreen device nodes..."
if [ -e /dev/input/event0 ] || [ -e /dev/input/event1 ]; then
    EVENT_COUNT=$(ls -1 /dev/input/event* 2>/dev/null | wc -l)
    log_result "PASS" "Touchscreen device nodes found: $EVENT_COUNT event devices"
else
    log_result "FAIL" "No touchscreen device nodes found"
fi

# Test 4: Check touchscreen sysfs entries
log -t $LOG_TAG "Test 4: Checking touchscreen sysfs entries..."
if [ -d /sys/class/vts/vivo_ts ]; then
    log_result "PASS" "Touchscreen sysfs entries exist"
else
    log_result "FAIL" "Touchscreen sysfs entries do not exist"
fi

# Test 5: Check touchscreen properties
log -t $LOG_TAG "Test 5: Checking touchscreen properties..."
if [ -f /sys/class/vts/vivo_ts/properties/type ]; then
    TS_TYPE=$(cat /sys/class/vts/vivo_ts/properties/type 2>/dev/null)
    if [ -n "$TS_TYPE" ]; then
        log_result "PASS" "Touchscreen type detected: $TS_TYPE"
    else
        log_result "FAIL" "Touchscreen type not readable"
    fi
else
    log_result "FAIL" "Touchscreen properties file not found"
fi

# Test 6: Check touchscreen dimensions
log -t $LOG_TAG "Test 6: Checking touchscreen dimensions..."
if [ -f /sys/class/vts/vivo_ts/properties/dimension_x ] && [ -f /sys/class/vts/vivo_ts/properties/dimension_y ]; then
    DIM_X=$(cat /sys/class/vts/vivo_ts/properties/dimension_x 2>/dev/null)
    DIM_Y=$(cat /sys/class/vts/vivo_ts/properties/dimension_y 2>/dev/null)
    if [ -n "$DIM_X" ] && [ -n "$DIM_Y" ]; then
        log_result "PASS" "Touchscreen dimensions: ${DIM_X}x${DIM_Y}"
    else
        log_result "FAIL" "Touchscreen dimensions not readable"
    fi
else
    log_result "FAIL" "Touchscreen dimension files not found"
fi

# Test 7: Check touchscreen firmware version
log -t $LOG_TAG "Test 7: Checking touchscreen firmware version..."
if [ -f /sys/class/vts/vivo_ts/version ]; then
    FW_VERSION=$(cat /sys/class/vts/vivo_ts/version 2>/dev/null)
    if [ -n "$FW_VERSION" ]; then
        log_result "PASS" "Touchscreen firmware version: $FW_VERSION"
    else
        log_result "FAIL" "Touchscreen firmware version not readable"
    fi
else
    log_result "FAIL" "Touchscreen firmware version file not found"
fi

# Test 8: Check touchscreen calibration status
log -t $LOG_TAG "Test 8: Checking touchscreen calibration status..."
if [ -f /sys/class/vts/vivo_ts/properties/need_calibration ]; then
    CALIBRATION=$(cat /sys/class/vts/vivo_ts/properties/need_calibration 2>/dev/null)
    log_result "PASS" "Touchscreen calibration status: $CALIBRATION"
else
    log_result "FAIL" "Touchscreen calibration status file not found"
fi

# Test 9: Check touchscreen sensor count
log -t $LOG_TAG "Test 9: Checking touchscreen sensor count..."
if [ -f /sys/class/vts/vivo_ts/properties/rx_sensors ] && [ -f /sys/class/vts/vivo_ts/properties/tx_sensors ]; then
    RX_SENSORS=$(cat /sys/class/vts/vivo_ts/properties/rx_sensors 2>/dev/null)
    TX_SENSORS=$(cat /sys/class/vts/vivo_ts/properties/tx_sensors 2>/dev/null)
    if [ -n "$RX_SENSORS" ] && [ -n "$TX_SENSORS" ]; then
        log_result "PASS" "Touchscreen sensors: RX=$RX_SENSORS, TX=$TX_SENSORS"
    else
        log_result "FAIL" "Touchscreen sensor count not readable"
    fi
else
    log_result "FAIL" "Touchscreen sensor count files not found"
fi

# Test 10: Check touchscreen status
log -t $LOG_TAG "Test 10: Checking touchscreen status..."
if [ -f /sys/class/vts/vivo_ts/status/lcd_on ]; then
    LCD_STATUS=$(cat /sys/class/vts/vivo_ts/status/lcd_on 2>/dev/null)
    if [ -n "$LCD_STATUS" ]; then
        log_result "PASS" "Touchscreen LCD status: $LCD_STATUS"
    else
        log_result "FAIL" "Touchscreen LCD status not readable"
    fi
else
    log_result "FAIL" "Touchscreen status file not found"
fi

# Test 11: Check touchscreen firmware files
log -t $LOG_TAG "Test 11: Checking touchscreen firmware files..."
if [ -f /vendor/firmware/touch_firmwares_recovery.bin ]; then
    log_result "PASS" "Touchscreen firmware file exists"
else
    log_result "FAIL" "Touchscreen firmware file not found"
fi

# Test 12: Check touchscreen configuration files
log -t $LOG_TAG "Test 12: Checking touchscreen configuration files..."
CONFIG_COUNT=$(ls -1 /vendor/firmware/TP-*.bin 2>/dev/null | wc -l)
if [ "$CONFIG_COUNT" -gt 0 ]; then
    log_result "PASS" "Touchscreen configuration files found: $CONFIG_COUNT files"
else
    log_result "FAIL" "No touchscreen configuration files found"
fi

# Test 13: Check touchscreen input device
log -t $LOG_TAG "Test 13: Checking touchscreen input device..."
INPUT_DEVICES=$(ls -1 /sys/class/input/ 2>/dev/null | grep -i "event\|touch" | wc -l)
if [ "$INPUT_DEVICES" -gt 0 ]; then
    log_result "PASS" "Touchscreen input devices found: $INPUT_DEVICES devices"
else
    log_result "FAIL" "No touchscreen input devices found"
fi

# Test 14: Check touchscreen gesture support
log -t $LOG_TAG "Test 14: Checking touchscreen gesture support..."
if [ -f /sys/class/vts/vivo_ts/status/gesture ]; then
    log_result "PASS" "Touchscreen gesture support available"
else
    log_result "FAIL" "Touchscreen gesture support not available"
fi

# Test 15: Check touchscreen area
log -t $LOG_TAG "Test 15: Checking touchscreen area..."
if [ -f /sys/class/vts/vivo_ts/touch_area ]; then
    log_result "PASS" "Touchscreen area configuration exists"
else
    log_result "FAIL" "Touchscreen area configuration not found"
fi

# Summary
log -t $LOG_TAG "========================================="
log -t $LOG_TAG "Touchscreen Response Accuracy Test Summary"
log -t $LOG_TAG "========================================="
log -t $LOG_TAG "Total Tests: $TEST_COUNT"
log -t $LOG_TAG "Passed: $PASS_COUNT"
log -t $LOG_TAG "Failed: $FAIL_COUNT"
log -t $LOG_TAG "Success Rate: $(awk "BEGIN {printf \"%.2f\", ($PASS_COUNT/$TEST_COUNT)*100}")%"
log -t $LOG_TAG "========================================="

# Exit with appropriate code
if [ $FAIL_COUNT -eq 0 ]; then
    log -t $LOG_TAG "All touchscreen tests passed successfully!"
    exit 0
else
    log -t $LOG_TAG "Some touchscreen tests failed. Please check logs above."
    exit 1
fi
