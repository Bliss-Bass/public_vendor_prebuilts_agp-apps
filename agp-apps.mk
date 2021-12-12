LOCAL_PATH := $(call my-dir)

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml

ifeq ($(USE_AGP_WALLPAPER),true)
DEVICE_PACKAGE_OVERLAYS += vendor/prebuilts/agp-apps/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/prebuilts/agp-apps/overlay
endif
