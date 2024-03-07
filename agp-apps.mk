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

ifeq ($(USE_SMARTDOCK_B),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/smart-dock-b/permissions/cu.axel.smartdock-permissions.xml:system/etc/permissions/cu.axel.smartdock-permissions.xml
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

ifeq ($(USE_BLISS_TV_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tv-launcher/permissions/nl.ndat.tvlauncher-permissions.xml:system/etc/permissions/nl.ndat.tvlauncher-permissions.xml
endif

ifeq ($(USE_POS_TERMINAL_APP),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/pos-terminal/permissions/at.smartlab.tshop-privapp-permissions.xml:system/etc/permissions/at.smartlab.tshop-privapp-permissions.xml \
    $(LOCAL_PATH)/pos-terminal/permissions/at.smartlab.tshop.kdisplay-generated-permissions.xml:system/etc/permissions/at.smartlab.tshop.kdisplay-generated-permissions.xml
endif

ifeq ($(USE_TASKBAR_UI),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/taskbar/permissions/privapp-permissions-com.farmerbb.taskbar.support.xml:system/etc/permissions/privapp-permissions-com.farmerbb.taskbar.support.xml \
    $(LOCAL_PATH)/taskbar/permissions/privapp-permissions-com.farmerbb.taskbar.xml:system/etc/permissions/privapp-permissions-com.farmerbb.taskbar.xml
endif

ifeq ($(USE_PER_DISPLAY_FOCUS),true)

PRODUCT_PACKAGES += \
    MultiDisplay

ifeq ($(USE_PER_DISPLAY_FOCUS_ZQY_IME),true)

PRODUCT_PACKAGES += \
    zqyMultiClientInputMethod

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.multi_client_ime=com.zqy.multidisplayinput/.MultiClientInputMethod \
    ro.sys.multi_client_ime=com.zqy.multidisplayinput/.MultiClientInputMethod
else

    nozqyime=true

endif

ifeq ($(USE_PER_DISPLAY_FOCUS_IME),true)
PRODUCT_PACKAGES += \
    MultiClientInputMethod

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.multi_client_ime=com.example.android.multiclientinputmethod/.MultiClientInputMethod \
    ro.sys.multi_client_ime=com.example.android.multiclientinputmethod/.MultiClientInputMethod

else

    nomcime=true

endif

# if nozqyime and nomcime are true, then we have no ime
ifeq ($(nozqyime),true)
ifeq ($(nomcime),true)

# PRODUCT_PROPERTY_OVERRIDES += \
#     persist.debug.multi_client_ime=com.android.inputmethod.latin/.LatinIME \
#     ro.sys.multi_client_ime=com.android.inputmethod.latin/.LatinIME

PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.bliss.force_ime_on_all_displays=true

endif
endif

endif

ifeq ($(USE_ANDROID_AUTO),true)
PRODUCT_PACKAGES += \
    AndroidAuto

endif

