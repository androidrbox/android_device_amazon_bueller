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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product-if-exists, vendor/amazon/bueller/bueller-vendor.mk)
$(call inherit-product-if-exists, vendor/google/atv/atv-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/bueller/overlay

# Boot animation and screen size
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=320

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Audio configuration
PRODUCT_COPY_FILES += \
    device/amazon/bueller/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/amazon/bueller/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x

# Media configuration
PRODUCT_COPY_FILES += \
    device/amazon/bueller/media/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler

# CRDA
PRODUCT_PACKAGES += \
    crda \
    linville.key.pub.pem \
    regdbdump \
    regulatory.bin

# Display
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    memtrack.msm8960

# Media
PRODUCT_COPY_FILES += \
    device/amazon/bueller/configs/media_codecs.xml:system/etc/media_codecs.xml

# OMX
PRODUCT_PACKAGES += \
    libdashplayer \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw \
    qcmediaplayer

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# Power
PRODUCT_PACKAGES += \
    power.msm8960

# Ramdisk
PRODUCT_COPY_FILES += \
    device/amazon/bueller/rootdir/etc/fstab.qcom:root/fstab.qcom \
    device/amazon/bueller/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    device/amazon/bueller/rootdir/etc/init.qcom.rc:root/init.qcom.rc \
    device/amazon/bueller/rootdir/etc/init.qcom.misc.sh:root/init.qcom.misc.sh \
    device/amazon/bueller/rootdir/etc/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/amazon/bueller/rootdir/etc/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/amazon/bueller/rootdir/etc/busybox.static:root/sbin/busybox.static \
    device/amazon/bueller/rootdir/etc/logcat.static:root/sbin/logcat.static \
    device/amazon/bueller/rootdir/etc/reboot.static:root/sbin/reboot.static

# Thermal
PRODUCT_COPY_FILES += \
    device/amazon/bueller/configs/thermald-8960.conf:system/etc/thermald-8960.conf

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += wpa_supplicant

PRODUCT_COPY_FILES += \
    device/amazon/bueller/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    debug.mdpcomp.logs=0 \
    persist.hwc.mdpcomp.enable=true

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

PRODUCT_CHARACTERISTICS := tablet,nosdcard

####
PRODUCT_PACKAGES += \
    TvProvider \
    TvSettings \
    tv_input.default

PRODUCT_COPY_FILES += \
    device/amazon/bueller/tv_core_hardware.xml:system/etc/permissions/tv_core_hardware.xml

####

PRODUCT_NAME := full_bueller
PRODUCT_DEVICE := bueller
PRODUCT_BRAND := qcom
PRODUCT_MANUFACTURER := Amazon
PRODUCT_MODEL := AFTB

$(call inherit-product, vendor/cm/config/common_mini_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bueller \
    TARGET_DEVICE=bueller \
    BUILD_FINGERPRINT="qcom/bueller/bueller:4.2.2/JDQ39/51.1.4.2_user_514015320:user/release-keys" \
    PRIVATE_BUILD_DESC="bueller-user 4.2.2 JDQ39 51.1.4.2_user_514015320 release-keys"

PRODUCT_NAME := cm_bueller
PRODUCT_DEVICE := bueller
