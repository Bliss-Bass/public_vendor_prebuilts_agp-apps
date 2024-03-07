LOCAL_PATH := $(my-dir)

ifeq ("$(USE_BLISS_GARLIC_LAUNCHER)","true")


include $(CLEAR_VARS)
LOCAL_MODULE := com.sagiadinos.garlic.player
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := bin/com.sagiadinos.garlic.player.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := 

include $(BUILD_PREBUILT)

else
include $(call all-subdir-makefiles)

endif

