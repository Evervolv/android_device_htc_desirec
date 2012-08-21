#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic incredible,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us.mk)

PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/root/init.desirec.rc:root/init.desirec.rc \
    device/htc/desirec/prebuilt/root/init.desirec.usb.rc:root/init.desirec.usb.rc \
    device/htc/desirec/prebuilt/root/ueventd.desirec.rc:root/ueventd.desirec.rc

DEVICE_PACKAGE_OVERLAYS := device/htc/desirec/overlay

PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/desirec/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/desirec/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    device/htc/desirec/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    device/htc/desirec/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf

# Prebuilt libcamera for HAL
PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/htc/desirec/prebuilt/lib/libcamera.so:system/lib/libcamera.so

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.desirec \
    lights.desirec \
    lights.msm7k \
    audio.usb.default \
    audio.a2dp.default \
    audio.primary.desirec \
    audio_policy.desirec \
    gralloc.desirec \
    gps.desirec \
    camera.msm7k \
    wlan_loader \
    tiwlan.ini \
    dhcpcd.conf \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/desirec/prebuilt/usr/idc/melfas-tsi-touchscreen.idc:system/usr/idc/melfas-tsi-touchscreen.idc \
    device/htc/desirec/prebuilt/usr/idc/desirec-nav.idc:system/usr/idc/desirec-nav.idc

PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/root/init.desirec.rc:root/init.desirec.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/usr/keylayout/desirec-keypad.kl:system/usr/keylayout/desirec-keypad.kl \
    device/htc/desirec/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keymap
PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/usr/keychars/desirec-keypad.kcm:system/usr/keychars/desirec-keypad.kcm

# Undead call fix
PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/xbin/dmportread.sh:system/xbin/dmportread.sh

# Disable HWAccel for now
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.disable_hw_accel=true

# USB mass storage
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

# ADB access
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

# Set dirty_ratio for UMS
PRODUCT_PROPERTY_OVERRIDES += ro.vold.umsdirtyratio=20

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.def.agps.mode=2 \
    wifi.interface=tiwlan0 \
    wifi.supplicant_scan_interval=45

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Performences tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=false \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.execution-mode=int:fast \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=32m \
    dalvik.vm.heapsize=64m \
    ro.compcache.default=0 \
    persist.sys.use_dithering=0 \
    persist.sys.purgeable_assets=1

# OpenGL ES 1.1-CM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 65537

# sysctl parameters
PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# Default network type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4 \
    ro.com.google.clientidbase=android-verizon-us \
    ro.com.google.locationfeatures=1 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.home.operator.numeric=310012 \
    ro.cdma.homesystem=128,64 \
    ro.cdma.data_retry_config=default_randomization=960000,960000,960000,960000,960000

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1

PRODUCT_LOCALES += en

# DesireC uses medium-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/desirec/prebuilt/root/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

KERNEL_NAME := 2.6.29-DecaFuctCFS-dirty-9ff84b92

PRODUCT_COPY_FILES += \
    device/htc/desirec/prebuilt/lib/modules/modules.dep.bb:system/lib/modules/$(KERNEL_NAME)/modules.dep.bb \
    device/htc/desirec/prebuilt/lib/modules/modules.order:system/lib/modules/$(KERNEL_NAME)/modules.order \
    device/htc/desirec/prebuilt/lib/modules/wlan.ko:system/lib/modules/$(KERNEL_NAME)/drivers/net/wireless/tiwlan1251/wlan.ko \
    device/htc/desirec/prebuilt/lib/modules/hid-dummy.ko:system/lib/modules/$(KERNEL_NAME)/drivers/hid/hid-dummy.ko \
    device/htc/desirec/prebuilt/lib/modules/wlan.ko:system/lib/modules/wlan.ko

$(call inherit-product-if-exists, vendor/htc/desirec/desirec-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base_telephony.mk)


PRODUCT_NAME := full_desirec
PRODUCT_DEVICE := desirec
PRODUCT_MODEL := Full Android on DesireC
