#
# 2021 Bliss Roms - Adapted from Android-x86 Project
# Original Copyright (C) 2011-2015 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

LOCAL_PATH := $(call my-dir)
# ifneq ("$(wildcard vendor/foss/bin/*)","")
ifeq ("$(USE_VAPOR_LAUNCHER)","true")

ifneq ($(filter %x86 %x86_64,$(TARGET_PRODUCT)),)
VAPOR_APPNAME_SUFFIX := x86_64
else
VAPOR_APPNAME_SUFFIX := arm64
endif

include $(CLEAR_VARS)
LOCAL_MODULE := Vapor
LOCAL_SRC_FILES := imperador.vapor.android.$(VAPOR_APPNAME_SUFFIX).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_REQUIRED_MODULES := org.vapor.android-priv-app-permissions.xml
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions androidx.window.sidecar
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := org.vapor.android-priv-app-permissions.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

else
include $(call all-subdir-makefiles)

endif
