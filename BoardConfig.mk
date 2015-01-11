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

NETD_DISABLE_ROUTE_FLUSH := true

USE_CAMERA_STUB := true

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8960
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_BOOTLOADER_BOARD_NAME := MSM8960

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760       # 10M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760   # 10M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368    # 768M
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368     # 768M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6104963072 # 5.68G
BOARD_FLASH_BLOCK_SIZE := 131072

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# Logging
TARGET_USES_LOGD := false

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/amazon/bueller
TARGET_KERNEL_CONFIG := bueller-perf_defconfig

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
QCOM_ADSP_SSR_ENABLED := false
QCOM_ANC_HEADSET_ENABLED := false
QCOM_FLUENCE_ENABLED := false

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_QCOM_BSP := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Display
BOARD_EGL_CFG := device/amazon/bueller/configs/egl.cfg
BOARD_USES_LEGACY_MMAP := true
COMMON_GLOBAL_CFLAGS += -DNEW_ION_API
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_INSECURE_MM_HEAP := true
# hack: mdp_buf_sync has no member named retire_fen_fd
#TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_NO_ADAPTIVE_PLAYBACK := true
TARGET_NO_INITLOGO := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Make boot faster
WITH_DEXPREOPT := true

# Wifi
BOARD_WLAN_DEVICE                := ath6kl
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_NEEDS_WIFI_DELAY           := true
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/wlan/parameters/fwpath"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"

# Fonts
EXTENDED_FONT_FOOTPRINT := true

