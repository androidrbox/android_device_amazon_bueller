# Copyright (C) 2015 rbox
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),bueller)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)
LOCAL_MODULE := uinput
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := uinput.c
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)/sbin
include $(BUILD_EXECUTABLE)

FIRMWARE_DXHDCP2_IMAGES := dxhdcp2.b00 dxhdcp2.b01 dxhdcp2.b02 dxhdcp2.b03 dxhdcp2.mdt

FIRMWARE_DXHDCP2_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_DXHDCP2_IMAGES)))
$(FIRMWARE_DXHDCP2_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DXHDCP2 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_DXHDCP2_SYMLINKS)

FIRMWARE_Q6_IMAGES := q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt

FIRMWARE_Q6_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_Q6_IMAGES)))
$(FIRMWARE_Q6_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Q6 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_Q6_SYMLINKS)

FIRMWARE_TZ_IMAGES := tzapps.b00 tzapps.b01 tzapps.b02 tzapps.b03 tzapps.mdt

FIRMWARE_TZ_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_TZ_IMAGES)))
$(FIRMWARE_TZ_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "TZ Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_TZ_SYMLINKS)

FIRMWARE_WEBCRYPT_IMAGES := webcrypt.b00 webcrypt.b01 webcrypt.b02 webcrypt.b03 webcrypt.mdt

FIRMWARE_WEBCRYPT_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIRMWARE_WEBCRYPT_IMAGES)))
$(FIRMWARE_WEBCRYPT_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Webcrypt Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_WEBCRYPT_SYMLINKS)

endif
