#!/system/bin/sh
# USB Connection Stability Test Script for TWRP
# This script tests USB connection stability and functionality

LOG_TAG="usb_test"
log -t $LOG_TAG "Starting USB connection stability test"

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

# Test 1: Check if USB controller is available
log -t $LOG_TAG "Test 1: Checking USB controller availability..."
if [ -d /sys/class/udc ]; then
    UDC=$(ls /sys/class/udc | head -n 1)
    if [ -n "$UDC" ]; then
        log_result "PASS" "USB controller found: $UDC"
    else
        log_result "FAIL" "No USB controller found"
    fi
else
    log_result "FAIL" "USB controller directory not found"
fi

# Test 2: Check if configfs is mounted
log -t $LOG_TAG "Test 2: Checking configfs mount status..."
if mount | grep -q configfs; then
    log_result "PASS" "configfs is mounted"
else
    log_result "FAIL" "configfs is not mounted"
fi

# Test 3: Check USB gadget directory
log -t $LOG_TAG "Test 3: Checking USB gadget directory..."
if [ -d /config/usb_gadget/g1 ]; then
    log_result "PASS" "USB gadget directory exists"
else
    log_result "FAIL" "USB gadget directory does not exist"
fi

# Test 4: Check ADB function
log -t $LOG_TAG "Test 4: Checking ADB function..."
if [ -d /config/usb_gadget/g1/functions/ffs.adb ]; then
    log_result "PASS" "ADB function is configured"
else
    log_result "FAIL" "ADB function is not configured"
fi

# Test 5: Check ADB daemon status
log -t $LOG_TAG "Test 5: Checking ADB daemon status..."
if pgrep -x adbd > /dev/null; then
    log_result "PASS" "ADB daemon is running"
else
    log_result "FAIL" "ADB daemon is not running"
fi

# Test 6: Check USB properties
log -t $LOG_TAG "Test 6: Checking USB properties..."
USB_CONFIG=$(getprop sys.usb.config)
USB_STATE=$(getprop sys.usb.state)
if [ -n "$USB_CONFIG" ] && [ -n "$USB_STATE" ]; then
    log_result "PASS" "USB properties set: config=$USB_CONFIG, state=$USB_STATE"
else
    log_result "FAIL" "USB properties not set properly"
fi

# Test 7: Check USB gadget activation
log -t $LOG_TAG "Test 7: Checking USB gadget activation..."
if [ -f /config/usb_gadget/g1/UDC ]; then
    UDC_STATUS=$(cat /config/usb_gadget/g1/UDC)
    if [ -n "$UDC_STATUS" ]; then
        log_result "PASS" "USB gadget is activated with UDC: $UDC_STATUS"
    else
        log_result "FAIL" "USB gadget is not activated"
    fi
else
    log_result "FAIL" "UDC file not found"
fi

# Test 8: Check functionfs mount
log -t $LOG_TAG "Test 8: Checking functionfs mount..."
if mount | grep -q functionfs; then
    log_result "PASS" "functionfs is mounted"
else
    log_result "FAIL" "functionfs is not mounted"
fi

# Test 9: Check USB device enumeration (simulated)
log -t $LOG_TAG "Test 9: Checking USB device enumeration..."
if [ -d /sys/bus/usb/devices ]; then
    DEVICE_COUNT=$(ls -1 /sys/bus/usb/devices | wc -l)
    if [ "$DEVICE_COUNT" -gt 0 ]; then
        log_result "PASS" "USB devices enumerated: $DEVICE_COUNT devices"
    else
        log_result "FAIL" "No USB devices enumerated"
    fi
else
    log_result "FAIL" "USB devices directory not found"
fi

# Test 10: Check USB gadget configuration
log -t $LOG_TAG "Test 10: Checking USB gadget configuration..."
if [ -d /config/usb_gadget/g1/configs/c.1 ]; then
    log_result "PASS" "USB gadget configuration exists"
else
    log_result "FAIL" "USB gadget configuration does not exist"
fi

# Summary
log -t $LOG_TAG "========================================="
log -t $LOG_TAG "USB Connection Stability Test Summary"
log -t $LOG_TAG "========================================="
log -t $LOG_TAG "Total Tests: $TEST_COUNT"
log -t $LOG_TAG "Passed: $PASS_COUNT"
log -t $LOG_TAG "Failed: $FAIL_COUNT"
log -t $LOG_TAG "Success Rate: $(awk "BEGIN {printf \"%.2f\", ($PASS_COUNT/$TEST_COUNT)*100}")%"
log -t $LOG_TAG "========================================="

# Exit with appropriate code
if [ $FAIL_COUNT -eq 0 ]; then
    log -t $LOG_TAG "All USB tests passed successfully!"
    exit 0
else
    log -t $LOG_TAG "Some USB tests failed. Please check the logs above."
    exit 1
fi
