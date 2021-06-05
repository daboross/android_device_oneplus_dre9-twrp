#!/system/bin/sh
# This script is needed to automatically set device props.

load_op8t()
{
    resetprop "ro.product.model" "OnePlus 8T"
    resetprop "ro.product.name" "OnePlus8T"
    resetprop "ro.build.product" "OnePlus8T"
    resetprop "ro.product.device" "OnePlus8T"
    resetprop "ro.vendor.product.device" "OnePlus8T"
    resetprop "ro.display.series" "OnePlus 8T"
}

project=$(getprop ro.boot.project_name)
echo $project

load_op8t

exit 0
