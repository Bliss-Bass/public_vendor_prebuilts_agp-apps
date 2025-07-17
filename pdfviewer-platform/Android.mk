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

ifeq ($(USE_PDFVIEWER_PLATFORM),true)

include $(CLEAR_VARS)
LOCAL_MODULE := PdfViewer
LOCAL_SRC_FILES := PdfViewer.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PRODUCT_MODULE := true
LOCAL_REQUIRED_MODULES := whitelist-app.grapheneos.pdfviewer.xml
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions androidx.window.sidecar
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := whitelist-app.grapheneos.pdfviewer.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/sysconfig
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

else
include $(call all-subdir-makefiles)

endif
