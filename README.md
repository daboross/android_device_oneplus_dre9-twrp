# Device Tree for OnePlus Nord N200 5G NA unlocked variant (dre9) for TWRP

The OnePlus Nord N200 5G (codenamed _"dre9"_) is a budget smartphone from
OnePlus. It was released June 25th, 2021.

| Basic                   | Spec Sheet                                                            |
| -----:|:----- |
| CPU                     | Octa-core (2x2.0 GHz Kryo 460 & 6x1.8 GHz Kryo 460)                   |
| Chipset                 | Qualcomm SM4350 Snapdragon 480 5G (8 nm)                              |
| GPU                     | Adreno 619                                                            |
| Memory                  | 4 GB RAM                                                              |
| Shipped Android Version | 11.0                                                                  |
| Storage                 | 64 GB                                                                 |
| Battery                 | Non-removable Li-Po 5000 mAh battery                                  |
| Display                 | LTPS IPS LCD, 90Hz, 1080 x 2400 pixels, 20:9 ratio (~405 ppi density) |

## Warning - Unffocial TWRP

This is not an official TWRP repository. Use at your own risk.

## Note on Codenames

Note: Some locations refer to this device as codename "holi". "holi" is the
codename for the board / platform, not the phone.

"dre9" is the codename for the OnePlusN200, the North America version of this
phone which is carrier unlocked.

"dre8t" is the codename for the OnePlusN200TMO, the version of this phone sold
by T-Mobile and Metro PCS.

https://github.com/OnePlusOSS/OpenSourceReleases/wiki/OnePlus-Nord-N200 is the
source for these codenames.

## Prereqs

I recommend reading through
https://forum.xda-developers.com/t/dev-how-to-compile-twrp-touch-recovery.1943625/
before attempting to compile this repository.

## Compile

First, create a new directory, and download the TWRP tree into it:

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
```

Next, add this repository via a local manifest. Create
`.repo/local_manifests/local_manifest.xml` with the following contents:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote name="github"
    fetch="https://github.com" />
  <project path="device/oneplus/dre9"
    name="daboross/android_device_oneplus_dre9-twrp"
    remote="github"
    revision="android-11" />
</manifest>
```

> You might need to pick few patches from gerrit.twrp.me to get some stuff working.

TODO: verify whether this comment ^^ copied from kebab is accurate.

Sync the sources:

```
repo sync
```

To build, execute these commands in order

```
. build/envsetup.sh && \
    export ALLOW_MISSING_DEPENDENCIES=true && \
    export LC_ALL=C && \
    lunch aosp_dre9-eng && \
    make -j adbd recoveryimage
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/dre9/recovery.img

# Since the Nord N200 5G has a separate recovery partition, you can flash the recovery with
fastboot flash recovery recovery.img
```

Kernel: https://github.com/AOSPA/android_kernel_oneplus_sm8250

##### Credits

- bigbiff for decryption
- theincognito-inc for original tree
- Systemad for original tree
- CaptainThrowback for original tree
- mauronofrio for original tree
- TWRP team
