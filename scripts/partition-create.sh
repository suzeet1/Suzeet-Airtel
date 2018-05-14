#!/bin/bash
fdisk -l | grep "/dev/vdb"
echo
echo pvcreate /dev/vdb
pvcreate /dev/vdb
vgcreate vg_vol_opt /dev/vdb
lvcreate -l+100%FREE -n lv_vol_opt vg_vol_opt
mkfs.xfs  /dev/mapper/vg_vol_opt-lv_vol_opt
mkdir /opt/bmc
echo "/dev/mapper/vg_vol_opt-lv_vol_opt     /opt/bmc    xfs   defaults         0 0" >> /etc/fstab
mount -a
setfacl -R -m u:bmcapp:rwx /opt/bmc
setfacl -R -m u:bmcapp:rwx /tmp
rpm -ivh /var/tmp/RPM/*
