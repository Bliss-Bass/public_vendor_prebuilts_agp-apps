#
# 2024 Navotpala Tech
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# To find what libraries it uses, use apt:
#  ~/Android/Sdk/build-tools/35.0.0/aapt dump badging ,apk_name> | grep uses-library

LOCAL_PATH := $(call my-dir)

ifeq ($(USE_MDS_PLATFORM),true)

include $(CLEAR_VARS)
LOCAL_MODULE := multidisplaysettings
LOCAL_SRC_FILES := multidisplaysettings.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_REQUIRED_MODULES := com.bliss.multidisplaysettings-permissions.xml whitelist-com.bliss.multidisplaysettings.xml
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions androidx.window.sidecar
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := com.bliss.multidisplaysettings-permissions.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := whitelist-com.bliss.multidisplaysettings.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/sysconfig
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := com.bliss.multidisplaysettings-default-permissions.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/default-permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

else
include $(call all-subdir-makefiles)

endif
