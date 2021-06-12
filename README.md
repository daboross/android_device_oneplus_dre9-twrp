# Device Tree for 8T (kebab) for TWRP
## Disclaimer - Unofficial TWRP!
These are personal test builds of mine. In no way do I hold responsibility if it/you messes up your device.
Proceed at your own risk.

## Setup repo tool
Setup repo tool from here https://source.android.com/setup/develop#installing-repo

## Compile

Sync aosp_r29 manifest:

```
repo init --depth=1 --partial-clone --clone-filter=blob:limit=10M -u https://android.googlesource.com/platform/manifest -b android-11.0.0_r29
```

Make a directory named local_manifest under .repo, and create a new manifest file, for example local_manifests.xml
and then paste the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="github"
	fetch="https://github.com/" />

<project path="device/oneplus/kebab"
	name="theincognito/android_device_oneplus_kebab"
	remote="github"
	revision="android-11" />
</manifest>
```
Use https://del.dog/a11-twrp-extras-updated.txt is same directory as well. You might need to pick few patches from gerrit.twrp.me to get some stuff working.

Sync the sources with

```
repo sync -j$(nproc --all)
```

To build, execute these commands in order

```
. build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; export LC_ALL=C; lunch aosp_kebab-eng; make -j$(nproc --all) adbd recoveryimage
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/kebab/recovery.img 

# Since 8T has a seperate recovery partition, you can flash the recovery with
fastboot flash recovery recovery.img
```

Kernel: https://github.com/LineageOS/android_kernel_oneplus_sm8250

##### Credits
- bigbiff for decryption
- Systemad for original tree
- CaptainThrowback for original tree
- mauronofrio for original tree
- TWRP team
