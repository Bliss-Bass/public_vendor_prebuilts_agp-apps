-include vendor/agp-apps/apps.mk
-include $(wildcard vendor/agp-apps/genapps_*.mk)
-include vendor/agp-apps/private/ag-private-apps.mk

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

ifeq ($(USE_BLISS_RESTRICTED_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/restricted_app/permissions/com.bliss.restrictedlauncher-permissions.xml:system/etc/permissions/com.bliss.restrictedlauncher-permissions.xml
endif

ifeq ($(USE_BLISS_GARLIC_LAUNCHER),true)
# Private permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/garlic_launcher/permissions/com.sagiadinos.garlic.launcher-permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.sagiadinos.garlic.launcher-permissions.xml \
    $(LOCAL_PATH)/garlic_player/permissions/com.sagiadinos.garlic.player-permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.sagiadinos.garlic.player-permissions.xml

endif

ifeq ($(USE_BLISS_GAME_MODE_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/game_mode/permissions/com.sinu.molla-permissions.xml:system/etc/permissions/com.sinu.molla-permissions.xml
endif

ifeq ($(USE_BLISS_CROSS_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/crosslauncher/permissions/id.psw.vshlauncher-permissions.xml:system/etc/permissions/id.psw.vshlauncher-permissions.xml
endif

ifeq ($(USE_TASKBAR_UI),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/taskbar/permissions/privapp-permissions-com.farmerbb.taskbar.support.xml:system/etc/permissions/privapp-permissions-com.farmerbb.taskbar.support.xml \
    $(LOCAL_PATH)/taskbar/permissions/privapp-permissions-com.farmerbb.taskbar.xml:system/etc/permissions/privapp-permissions-com.farmerbb.taskbar.xml
endif

ifeq ($(USE_PER_DISPLAY_FOCUS),true)

ifeq ($(USE_PER_DISPLAY_FOCUS_ZQY),true)

PRODUCT_PACKAGES += \
    zqyMultiClientInputMethod \
    MultiDisplay

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.multi_client_ime=com.zqy.multidisplayinput/.MultiClientInputMethod \
    ro.sys.multi_client_ime=com.zqy.multidisplayinput/.MultiClientInputMethod

else

PRODUCT_PACKAGES += \
    MultiClientInputMethod \
    MultiDisplay

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.multi_client_ime=com.example.android.multiclientinputmethod/.MultiClientInputMethod \
    ro.sys.multi_client_ime=com.example.android.multiclientinputmethod/.MultiClientInputMethod

endif

endif

