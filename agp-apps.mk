LOCAL_PATH := $(my-dir)

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml

# Copy any Permissions files, overriding anything if needed    
$(foreach f,$(wildcard $(LOCAL_PATH)/priv-app/permissions/*.xml),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $f)))

ifneq ("$(wildcard vendor/foss/bin/*)","")
$(foreach f,$(wildcard $(LOCAL_PATH)/foss_privapp/permissions/*.xml),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $f)))
endif

#~ DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
