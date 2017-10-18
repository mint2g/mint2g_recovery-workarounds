#!/stage1/busybox sh

set -x 

export _PATH="$PATH"
export PATH=/stage1

busybox pwd
busybox date >>boot.txt

# exec >>boot.txt 2>&1
# busyox rm /init

busybox mount -t proc proc /proc
busybox mount -t tmpfs none /dev
busybox mount -t sysfs sysfs /sys

busybox mknod /dev/mmcblk0 b 179 0
busybox mknod /dev/mmcblk0p22 b 179 22


#busybox setsid busybox getty -L -l /stage1/busybox/sh -n 115200 /dev/ttyGS0

while ! busybox test -d /sys/dev/block/179:0 ; do
	busybox echo "waiting for internal mmc" >>boot.txt
	busybox sleep 1
done

# busybox ls -l /dev/
# busybox ls -l /sys/dev/block/179:0/
# busybox ash

busybox mount -t ext4 -o ro /dev/mmcblk0p22 /recovery-ramdisk

image=/recovery-ramdisk/ramdisk-recovery.img

busybox echo "loading ramdisk-recovery.img" >>boot.txt

# disable lpm
busybox echo 0 > /sys/class/power_supply/battery/charging_mode_booting

busybox gzip -d < $image > /stage1/ramdisk.cpio
busybox umount /recovery-ramdisk

busybox cpio -ui < /stage1/ramdisk.cpio

busybox umount /sys
busybox umount /proc
busybox date >>boot.txt
busybox rm -rf /stage1 /recovery-ramdisk /dev/*

export PATH="${_PATH}"
