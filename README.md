

trying to workaround 10mb recovery limit by using "hidden" partition at /dev/block/mmcblk0p22  
which is a 128MB partition formatted as ext4

none seems to be working tho

```
load-ramdisk:
	try to load recovery ramdisk by extracting and execing init
```

```
symlink-ramdisk:
	symlink /sbin and /twres to /ramdisk-recovery/twrp/ files
```
