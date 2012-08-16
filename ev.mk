# Inherit AOSP device configuration for desirec.
$(call inherit-product, device/htc/desirec/full_desirec.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_small_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_desirec
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := desirec
PRODUCT_MODEL := Eris
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=google/passion/passion:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 GRI40 102588 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Eligo
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n------------MESSAGE------------\nThank you for choosing Evervolv\n for your HTC Droid Eris!\n\nPlease visit us at:\n \#evervolv on irc.freenode.net\n\nFollow @preludedrew on twitter\n for the latest Evervolv updates\n\nGet the latest rom at:\n http://www.evervolv.com\n--------------------------------\n"

PRODUCT_PACKAGES += \
    LegacyCamera

# Gallery2 replacement - QuickPic
PRODUCT_COPY_FILES +=  \
    device/htc/desirec/prebuilt/app/QuickPic.apk:system/app/Gallery2.apk \
    device/htc/desirec/prebuilt/lib/libqpicjni86.so:system/lib/libqpicjni88.so

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/tiny_data/etc/init.d/07cache2cache:system/etc/init.d/07cache2cache \
    vendor/ev/prebuilt/hvga/media/bootanimation.zip:system/media/bootanimation.zip
