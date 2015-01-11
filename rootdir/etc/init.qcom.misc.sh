#!/system/bin/sh

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

# Wifi
if [ -e /sys/bus/platform/drivers/msm_hsic_host ]; then
    if [ ! -L /sys/bus/usb/devices/1-1 ]; then
        echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
    else
        echo auto > /sys/bus/usb/devices/1-1/power/control
    fi

    chmod -h 0222 /sys/bus/platform/drivers/msm_hsic_host/bind
    chmod -h 0222 /sys/bus/platform/drivers/msm_hsic_host/unbind
fi
modprobe wlan
