# vendor_prebuilts_agp-apps

The repository to store prebuilt apks for Android-Generic Project.

## Including AGP-Apps in your builds

By default, all .apk files added to app/ & priv-app/ folders, will be automatically added to the build. 
Just make sure your project includes the inherit from the device.mk file:

	# Add agp-apps
	$(call inherit-product-if-exists, vendor/prebuilts/agp-apps/agp-apps.mk)


## Build Flags

We use build envirnment flags in order to include various prebuilts or overlays:

- USE_AGP_WALLPAPER - Enables the overlay to customize the default wallpaper and set it to what is found in overlay/frameworks/base/core/res/res/drawable-*/
- USE_SMARTDOCK - Includes @axel358 's Smart Dock as the default Desktop UI (https://github.com/axel358/smartdock)
- USE_TASKBAR_UI - Includes @farmerbb 's Taskbar as the default Desktop UI (https://github.com/farmerbb/Taskbar)
- USE_KERNEL_SU_PLUS - Includes Kernel-SU+ apk

### Example

You can export the configs from the device tree, or via CL exports. 

#### With Build Command:

	. build/envsetup.sh && \
	lunch android_x86_64-userdebug && \
	make clean && \
	export USE_TASKBAR_UI=false && \
	export USE_SMARTDOCK=true && \
	export USE_AGP_WALLPAPER=true && \
	make -j18 iso_img 


