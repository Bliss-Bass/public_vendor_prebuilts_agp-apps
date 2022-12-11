PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml

ifeq ($(USE_AGP_WALLPAPER),true)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/foss_privapp/permissions/com.aurora.services.xml:system/etc/permissions/com.aurora.services.xml

ifeq ($(USE_SMARTDOCK),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/smart-dock/permissions/cu.axel.smartdock-permissions.xml:system/etc/permissions/cu.axel.smartdock-permissions.xml
endif

ifeq ($(USE_TASKBAR_UI),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/taskbar/permissions/privapp-permissions-com.farmerbb.taskbar.support.xml:system/etc/permissions/privapp-permissions-com.farmerbb.taskbar.support.xml \
    $(LOCAL_PATH)/taskbar/permissions/privapp-permissions-com.farmerbb.taskbar.xml:system/etc/permissions/privapp-permissions-com.farmerbb.taskbar.xml
endif
