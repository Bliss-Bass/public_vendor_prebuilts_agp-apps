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

ifeq ($(USE_DROID_VNC_PLATFORM),true)

ifneq ($(filter %x86_64,$(TARGET_PRODUCT)),)
  APPNAME_SUFFIX := x86_64
else ifneq ($(filter %x86,$(TARGET_PRODUCT)),)
  APPNAME_SUFFIX := x86
else ifneq ($(filter %arm64,$(TARGET_PRODUCT)),)
  APPNAME_SUFFIX := arm64
else
  APPNAME_SUFFIX := armv7
endif

include $(CLEAR_VARS)
LOCAL_MODULE := droidvnc-ng-platform
LOCAL_SRC_FILES := droidvnc-ng-platform.$(APPNAME_SUFFIX).apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_REQUIRED_MODULES := net.christianbeier.droidvnc_ng-permissions.xml whitelist-net.christianbeier.droidvnc_ng.xml
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions androidx.window.sidecar
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := net.christianbeier.droidvnc_ng-permissions.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := whitelist-net.christianbeier.droidvnc_ng.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/sysconfig
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

else
include $(call all-subdir-makefiles)

endif
