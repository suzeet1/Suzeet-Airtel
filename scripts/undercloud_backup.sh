!/bin/bash

LOCATION_TMP="/backup_data/tmp_back/undercloud/"
LOCATION_KVM2="/home/backup/backup_data"
KVM2_HOST="10.91.113.157"


sudo mysqldump --opt --all-databases | gzip > "$LOCATION_TMP"undercloud-all-databases-`date +%F`.sql.gz
sudo tar --xattrs --xattrs-include='*.*' --ignore-failed-read -cf \
     /backup_data/tmp_back/undercloud/undercloud-backup-`date +%F`.tar \
     /backup_data/tmp_back/undercloud/undercloud-all-databases-`date +%F`.sql \
     /etc \
     /var/lib/glance \
     /var/lib/certmonger \
     /var/lib/docker \
     /var/lib/registry \
     /srv/node \
     /root \
     /home/stack

rsync --remove-source-files -azv  "$LOCATION_TMP"undercloud-* backup@$KVM2_HOST:$LOCATION_KVM2
