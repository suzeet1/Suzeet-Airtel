
##How to uncomment/comment line###################
Uncomment==>sed -i '/[/]dev/ s/^#//' fstab
comment==>sed -i '/[/]dev/ s/^/#/' fstab
########################

for i in `seq 151 241`; do ping -c 1 10.3.160.$i |grep 64\ bytes 2> /dev/null & done &
 for i in `seq 11 250`; do ping -c 1 10.107.146.$i | grep  64\ byte; done
 ============================Ansible Playbook=========================================
 [root@jump-server mobinet]# cat copy.yaml
---
- name: post scale out tasks
  hosts: bmc
  remote_user: root
  tasks:


    - name: passwd
      copy:
        src:  passwd
        dest: /tmp/passwd
        mode: 0600
        owner: root
        group: root
[root@jump-server mobinet]#
===================================================================

 crudini --set /etc/cinder/cinder.conf DEFAULT debug true
 cat /etc/cinder/cinder.conf | egrep -v "^#|^$"
 cat /etc/cinder/cinder.conf | egrep -v "^#|^$" | grep "^debug"
 sudo pcs status
 pcs resource restart openstack-cinder-volume
 systemctl status openstack-cinder-volume
 systemctl status | grep cinder
 systemctl restart openstack-cinder-scheduler.service
 systemctl restart openstack-cinder-api.service
 systemctl status openstack-cinder-api.service
 systemctl status openstack-cinder-scheduler.service
 crudini --set /etc/cinder/cinder.conf DEFAULT debug false
 cat /etc/cinder/cinder.conf | grep "^debug"
 pcs status
 pcs resource restart openstack-cinder-volume
 systemctl status | grep cinder
 systemctl restart openstack-cinder-api.service
 systemctl restart openstack-cinder-scheduler.service
 systemctl status openstack-cinder-scheduler.service
 systemctl status openstack-cinder-api.service
 systemctl status openstack-cinder-volume
###########################################################################
sed -i 's/172.16.50.6:\/NFS2/172.16.50.7:\/NFS2/g'  /etc/fstab
sed -i 's/172.16.50.6:\/NFS3/172.16.50.8:\/NFS3/g'  /etc/fstab
sed -i 's/172.16.50.6:\/NFS4/172.16.50.9:\/NFS4/g'  /etc/fstab
#################################################################################
