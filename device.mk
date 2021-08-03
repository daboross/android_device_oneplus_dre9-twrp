# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from virtual AB OTA config
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

LOCAL_PATH := device/oneplus/dre9

# define hardware platform
PRODUCT_PLATFORM := holi

# A/B support
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS := \
    boot \
    system \
    system_ext \
    vendor \
    vbmeta
    # oplusstanvbk \
    # multiimgoem \
    # logo \
    # vendor_boot \
    # featenabler \
    # uefisecapp \
    # core_nhlos \
    # imagefv \
    # dtbo \
    # vbmeta \
    # qupfw \
    # devcfg \
    # boot \
    # keymaster \
    # dsp \
    # abl \
    # bluetooth \
    # modem \
    # hyp \
    # tz \
    # rpm \
    # engineering_cdt \
    # xbl_config \
    # xbl \
    # vm-system \
    # vbmeta_system


PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
    checkpoint_gc

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
#TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl-wrapper.recovery \
    android.hardware.boot@1.0-impl-wrapper \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery \

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    resetprop

# qcom decryption
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# Apex libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

#TWRP
PRODUCT_COPY_FILES += \
    device/oneplus/dre9/prebuilt/systemmanifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/manifest.xml \
    device/oneplus/dre9/prebuilt/vendormanifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/manifest.xml \
