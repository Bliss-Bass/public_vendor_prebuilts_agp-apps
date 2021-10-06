LOCAL_PATH := $(call my-dir)

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml

#~ DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
