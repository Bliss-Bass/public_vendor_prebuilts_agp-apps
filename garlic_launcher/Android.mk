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
# ifeq ("$(USE_BLISS_GARLIC_LAUNCHER)","true")

include $(CLEAR_VARS)
LOCAL_MODULE := GarlicLauncher
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := GarlicLauncher.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := platform
LOCAL_OVERRIDES_PACKAGES := 
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_PRIVATE_PLATFORM_APIS := true
LOCAL_DEX_PREOPT := false

include $(BUILD_PREBUILT)

# else
# include $(call all-subdir-makefiles)

# endif
