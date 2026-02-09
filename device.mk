#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/vivo/PD1936

# Proprietary binaries and libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/system/bin/adbd:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/adbd \
    $(LOCAL_PATH)/proprietary/system/bin/minadbd:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/minadbd \
    $(LOCAL_PATH)/proprietary/system/bin/toolbox:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/toolbox \
    $(LOCAL_PATH)/proprietary/system/bin/dhcpcd:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/dhcpcd \
    $(LOCAL_PATH)/proprietary/system/bin/logd:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/logd \
    $(LOCAL_PATH)/proprietary/system/bin/keystore:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/keystore \
    $(LOCAL_PATH)/proprietary/system/bin/servicemanager:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/servicemanager \
    $(LOCAL_PATH)/proprietary/system/bin/hwservicemanager:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/hwservicemanager \
    $(LOCAL_PATH)/proprietary/system/bin/guardianangle:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/guardianangle \
    $(LOCAL_PATH)/proprietary/system/bin/wait_for_keymaster:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/wait_for_keymaster \
    $(LOCAL_PATH)/proprietary/system/bin/vivotool:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/vivotool \
    $(LOCAL_PATH)/proprietary/system/bin/vivofbe:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/vivofbe \
    $(LOCAL_PATH)/proprietary/system/bin/vts_app_recovery:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/vts_app_recovery \
    $(LOCAL_PATH)/proprietary/system/bin/little_buddy:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/little_buddy \
    $(LOCAL_PATH)/proprietary/system/bin/touch:$(TARGET_RECOVERY_ROOT_OUT)/system/bin/touch

# System libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/system/lib64/libminuivivo.so:$(TARGET_RECOVERY_ROOT_OUT)/system/lib64/libminuivivo.so \
    $(LOCAL_PATH)/proprietary/system/lib64/libvivofscrypt.so:$(TARGET_RECOVERY_ROOT_OUT)/system/lib64/libvivofscrypt.so \
    $(LOCAL_PATH)/proprietary/system/lib64/libvivogatekeeper.so:$(TARGET_RECOVERY_ROOT_OUT)/system/lib64/libvivogatekeeper.so \
    $(LOCAL_PATH)/proprietary/system/lib64/libft2.so:$(TARGET_RECOVERY_ROOT_OUT)/system/lib64/libft2.so \
    $(LOCAL_PATH)/proprietary/system/lib64/librecovery_ui.so:$(TARGET_RECOVERY_ROOT_OUT)/system/lib64/librecovery_ui.so

# Vendor binaries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/vendor/bin/qca_cld3_wlan.ko:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/qca_cld3_wlan.ko \
    $(LOCAL_PATH)/proprietary/vendor/bin/wpa_supplicant:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/wpa_supplicant \
    $(LOCAL_PATH)/proprietary/vendor/bin/wpa_cli:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/wpa_cli \
    $(LOCAL_PATH)/proprietary/vendor/bin/cnss-daemon:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/cnss-daemon \
    $(LOCAL_PATH)/proprietary/vendor/bin/qseecomd:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/qseecomd \
    $(LOCAL_PATH)/proprietary/vendor/bin/rmt_storage:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/rmt_storage \
    $(LOCAL_PATH)/proprietary/vendor/bin/tftp_server:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/tftp_server \
    $(LOCAL_PATH)/proprietary/vendor/bin/vndservicemanager:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/vndservicemanager \
    $(LOCAL_PATH)/proprietary/vendor/bin/android.hardware.keymaster@4.0-service-qti:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/android.hardware.keymaster@4.0-service-qti \
    $(LOCAL_PATH)/proprietary/vendor/bin/android.hardware.gatekeeper@1.0-service-qti:$(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/android.hardware.gatekeeper@1.0-service-qti

# Vendor libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/vendor/lib64/libQSEEComAPI.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libQSEEComAPI.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/libsecureui.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libsecureui.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/libdiag.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libdiag.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/libdsutils.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libdsutils.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/libqmiservices.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libqmiservices.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/libqrtr.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libqrtr.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/vendor.qti.hardware.wifi.supplicant@2.0.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/vendor.qti.hardware.wifi.supplicant@2.0.so \
    $(LOCAL_PATH)/proprietary/vendor/lib64/vendor.vivo.hardware.wifi.supplicant@1.0.so:$(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/vendor.vivo.hardware.wifi.supplicant@1.0.so

# Touchscreen firmware (critical for touch functionality)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/proprietary/vendor/firmware/touch_firmwares_recovery.bin:$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/touch_firmwares_recovery.bin \
    $(LOCAL_PATH)/proprietary/vendor/firmware/TP-FW-PD1936-LCMID33-VER0x502100028.bin:$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/TP-FW-PD1936-LCMID33-VER0x502100028.bin \
    $(LOCAL_PATH)/proprietary/vendor/firmware/TP-CONFIG-FW-PD1936-LCMID33-VER0x0028.bin:$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/TP-CONFIG-FW-PD1936-LCMID33-VER0x0028.bin \
    $(LOCAL_PATH)/proprietary/vendor/firmware/TP-FW-PD1936-LCMID33-VER0x50213002C.bin:$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/TP-FW-PD1936-LCMID33-VER0x50213002C.bin \
    $(LOCAL_PATH)/proprietary/vendor/firmware/TP-CONFIG-FW-PD1936-LCMID33-VER0x002C.bin:$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/TP-CONFIG-FW-PD1936-LCMID33-VER0x002C.bin \
    $(LOCAL_PATH)/proprietary/vendor/firmware/bdwlan.bin.4g:$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/bdwlan.bin.4g


# Recovery configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_RECOVERY_ROOT_OUT)/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/ueventd.qcom.rc:$(TARGET_RECOVERY_ROOT_OUT)/ueventd.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.touch.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.touch.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.platform.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.platform.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.svc.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.svc.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.wifi.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.wifi.rc

# USB configuration (for ADB and MTP)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.usb.storage.type=mtp,adb \
    ro.sys.usb.ffs.mtp=1 \
    ro.sys.usb.ffs.adb=1 \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1