

trying to workaround 10mb recovery limit by using "hidden" partition at /dev/block/mmcblk0p22  
which is a 128MB partition formatted as ext4


### load-ramdisk:
	try to load recovery ramdisk by extracting and execing init
	ramdisk is stored as recovery-ramdisk.img in hidden partition
	it is possible to change recovery without updating the kernel
	and also have recovery sizes < 10mb,
	the img file is gzip compressed ramdisk of recovery

	the prebuilt init file is built from  
	https://github.com/mint2g/mint2g-init-recovery-stage1


### symlink-ramdisk:
  not working at the moment  
  try to symlink /sbin and /twres to /ramdisk-recovery/twrp/ files
