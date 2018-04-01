#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 21721088 c080b3ab839069d5766b5f0473c07c37faadec00 14352384 c5c1a6d5f5bc8db4141b14b24ed4964e8900f965
fi
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:21721088:c080b3ab839069d5766b5f0473c07c37faadec00; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:14352384:c5c1a6d5f5bc8db4141b14b24ed4964e8900f965 EMMC:/dev/block/bootdevice/by-name/recovery c080b3ab839069d5766b5f0473c07c37faadec00 21721088 c5c1a6d5f5bc8db4141b14b24ed4964e8900f965:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
