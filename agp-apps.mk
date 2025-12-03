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


ifeq ($(USE_ANDROID_AUTO),true)
PRODUCT_PACKAGES += \
    AndroidAuto

endif

ifeq ($(USE_FDEX11_PLATFORM),true)
PRODUCT_PACKAGES += \
    fdex11 \
    # FDELinuxAppLauncher \
    # FdePreInstaller

endif

ifeq ($(USE_BVNC_PLATFORM),true)
PRODUCT_PACKAGES += \
    bVNC

endif

ifeq ($(USE_BLISS_BOOT_CONFIG),true)
PRODUCT_PACKAGES += \
    com.bliss.bootconfig

endif

ifeq ($(USE_SMARTDOCK_PB),true)
PRODUCT_PACKAGES += \
    SmartDock_prebuilt \
    whitelist-cu.axel.smartdock.xml \
    cu.axel.smartdock-permissions.xml

endif

ifeq ($(USE_SMARTDOCK),true)
PRODUCT_PACKAGES += \
    SmartDock

endif

ifeq ($(USE_DROID_VNC_PLATFORM),true)
PRODUCT_PACKAGES += \
    droidvnc-ng-platform \
    whitelist-net.christianbeier.droidvnc_ng.xml \
    net.christianbeier.droidvnc_ng-permissions.xml

endif

ifeq ($(USE_MDS_PLATFORM),true)
PRODUCT_PACKAGES += \
    multidisplaysettings \
    whitelist-com.bliss.multidisplaysettings.xml \
    com.bliss.multidisplaysettings-default-permissions.xml \
    com.bliss.multidisplaysettings-permissions.xml

endif

ifeq ($(USE_PDFVIEWER_PLATFORM),true)
PRODUCT_PACKAGES += \
    PdfViewer \
    whitelist-app.grapheneos.pdfviewer.xml

endif

ifeq ($(USE_PRINT_PLATFORM),true)
PRODUCT_PACKAGES += \
    print-platform \
    org.billthefarmer.print-permissions.xml \
    whitelist-org.billthefarmer.print.xml

endif

ifeq ($(USE_SMARTDOCK_B),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/smart-dock-b/permissions/cu.axel.smartdock-permissions.xml:system/etc/permissions/cu.axel.smartdock-permissions.xml
endif

ifeq ($(USE_BLISS_RESTRICTED_LAUNCHER),true)
PRODUCT_PACKAGES += \
    BlissRestrictedLauncher \
    whitelist-com.bliss.restrictedlauncher.xml \
    com.bliss.restrictedlauncher-permissions.xml
    
endif

ifeq ($(USE_BLISS_GARLIC_LAUNCHER),true)

PRODUCT_PACKAGES += \
	GarlicLauncher \
	GarlicPlayer \

# Private permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/garlic_launcher/permissions/com.sagiadinos.garlic.launcher-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.sagiadinos.garlic.launcher-permissions.xml \
    $(LOCAL_PATH)/garlic_player/permissions/com.sagiadinos.garlic.player-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.sagiadinos.garlic.player-permissions.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/garlic_launcher/default-permissions/com.sagiadinos.garlic.launcher-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/com.sagiadinos.garlic.launcher-default-permissions.xml \
    $(LOCAL_PATH)/garlic_player/default-permissions/com.sagiadinos.garlic.player-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/com.sagiadinos.garlic.player-default-permissions.xml

endif

ifeq ($(USE_AURORA_STORE),true)

PRODUCT_PACKAGES += \
	AuroraServices \

# Private permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/AuroraServices/permissions/com.aurora.services-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.aurora.services-permissions.xml \
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/AuroraServices/default-permissions/com.aurora.services-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/com.aurora.services-default-permissions.xml \
   
endif



ifeq ($(USE_BLISS_GAME_MODE_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/game_mode/permissions/com.sinu.molla-permissions.xml:system/etc/permissions/com.sinu.molla-permissions.xml
endif

ifeq ($(USE_BLISS_CROSS_LAUNCHER),true)
PRODUCT_PACKAGES += \
    CrossLauncher \
    id.psw.vshlauncher-permissions.xml
    
endif

ifeq ($(USE_BLISS_TV_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tv-launcher/permissions/nl.ndat.tvlauncher-permissions.xml:system/etc/permissions/nl.ndat.tvlauncher-permissions.xml
endif

ifeq ($(USE_TITANIUS_LAUNCHER),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/titanius/permissions/app.titanius.launcher-permissions.xml:system/etc/permissions/app.titanius.launcher-permissions.xml
endif

ifeq ($(USE_VAPOR_LAUNCHER),true)
PRODUCT_PACKAGES += \
    Vapor \
    org.vapor.android-priv-app-permissions.xml

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

# ScreenView
ifeq ($(USE_SCREENVIEW),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/screenview/permissions/com.example.screenview-permissions.xml:system/etc/permissions/com.example.screenview-permissions.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/screenview/default-permissions/com.example.screenview-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/com.example.screenview-default-permissions.xml

endif


# Gboard options
ifeq ($(USE_GBOARD_PREBUILT),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gboard/permissions/com.google.android.inputmethod.latin-permissions.xml:system/etc/permissions/com.google.android.inputmethod.latin-permissions.xml
endif

ifeq ($(USE_GBOARD_LITE_PREBUILT),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gboard_lite/permissions/com.google.android.inputmethod.latin-permissions.xml:system/etc/permissions/com.google.android.inputmethod.latin-permissions.xml
endif

# per display focus options
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

