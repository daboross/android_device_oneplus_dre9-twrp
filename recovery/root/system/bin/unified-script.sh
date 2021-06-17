#!/system/bin/sh
# This script is needed to automatically set device props.


load_op8pro()
{
	echo resetting
    resetprop "ro.product.model" "OnePlus 8 Pro"
    resetprop "ro.product.name" "OnePlus8Pro"
    resetprop "ro.build.product" "OnePlus8Pro"
    resetprop "ro.product.device" "OnePlus8Pro"
    resetprop "ro.vendor.product.device" "OnePlus8Pro"
    resetprop "ro.display.series" "OnePlus 8 Pro"
}

load_op8()
{
    resetprop "ro.product.model" "OnePlus 8"
    resetprop "ro.product.name" "OnePlus8"
    resetprop "ro.build.product" "OnePlus8"
    resetprop "ro.product.device" "OnePlus8"
    resetprop "ro.vendor.product.device" "OnePlus8"
    resetprop "ro.display.series" "OnePlus 8"
}

load_op8t()
{
    resetprop "ro.build.product" "OnePlus8T"
    resetprop "ro.display.series" "OnePlus 8T"
    resetprop "ro.product.device" "OnePlus8T"
    resetprop "ro.product.model" "OnePlus 8T"
    resetprop "ro.product.name" "OnePlus8T"
    resetprop "ro.product.odm.device" "OnePlus8T"
    resetprop "ro.product.odm.model" "OnePlus 8T"
    resetprop "ro.product.odm.name" "OnePlus8T"
    resetprop "ro.product.product.device" "OnePlus8T"
    resetprop "ro.product.product.model" "OnePlus 8T"
    resetprop "ro.product.product.name" "OnePlus8T"
    resetprop "ro.product.system.device" "OnePlus8T"
    resetprop "ro.product.system.model" "OnePlus 8T"
    resetprop "ro.product.system.name" "OnePlus8T"
    resetprop "ro.product.system_ext.device" "OnePlus8T"
    resetprop "ro.product.system_ext.model" "OnePlus 8T"
    resetprop "ro.product.system_ext.name" "OnePlus8T"
    resetprop "ro.product.vendor.device" "OnePlus8T"
    resetprop "ro.product.vendor.model" "OnePlus 8T"
    resetprop "ro.product.vendor.name" "OnePlus8T"
    resetprop "ro.vendor.product.device" "OnePlus8T"
}

project=$(getprop ro.boot.project_codename)
echo "Running unified/variant script with $project..." >> /tmp/recovery.log

case $project in
    instantnoodlep*)
        load_op8pro
        ;;
    kebab*)
        load_op8t
        ;;
    *)
        load_op8
        ;;
esac

exit 0
