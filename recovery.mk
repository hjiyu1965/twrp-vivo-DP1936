#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Recovery Init Files
include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.platform.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/init.recovery.platform.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.qcom.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/init.recovery.qcom.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.svc.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/init.recovery.svc.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.touch.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/init.recovery.touch.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.wifi.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/init.recovery.wifi.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ueventd.qcom.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/ueventd.qcom.rc
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

# Touch Screen Recovery Service
include $(CLEAR_VARS)
LOCAL_MODULE := vts_app_recovery
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := recovery/root/system/bin/vts_app_recovery
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/system/bin
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# ABD
include $(CLEAR_VARS)
LOCAL_MODULE := adbd
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := recovery/root/system/bin/adbd
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/system/bin
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Vendor Services
include $(CLEAR_VARS)
LOCAL_MODULE := qseecomd.recovery
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := recovery/root/vendor/bin/qseecomd
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/bin
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vndservicemanager.recovery
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := recovery/root/vendor/bin/vndservicemanager
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/bin
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Touch Firmware
include $(CLEAR_VARS)
LOCAL_MODULE := touch_firmwares_recovery.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/vendor/firmware/touch_firmwares_recovery.bin
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TP-FW-PD1936-LCMID33-VER0x502100028.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/vendor/firmware/TP-FW-PD1936-LCMID33-VER0x502100028.bin
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TP-FW-PD1936-LCMID33-VER0x50213002C.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/vendor/firmware/TP-FW-PD1936-LCMID33-VER0x50213002C.bin
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TP-CONFIG-FW-PD1936-LCMID33-VER0x0028.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/vendor/firmware/TP-CONFIG-FW-PD1936-LCMID33-VER0x0028.bin
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TP-CONFIG-FW-PD1936-LCMID33-VER0x002C.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := recovery/root/vendor/firmware/TP-CONFIG-FW-PD1936-LCMID33-VER0x002C.bin
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)
