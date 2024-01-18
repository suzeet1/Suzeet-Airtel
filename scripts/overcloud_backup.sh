MYSQLDBPASS=$(sudo hiera -c /etc/puppet/hiera.yaml mysql::server::root_password)

mysql -uroot -p$MYSQLDBPASS -s -N -e "select distinct table_schema from information_schema.tables where engine='innodb' and table_schema != 'mysql';" | xargs mysqldump -uroot -p$MYSQLDBPASS --single-transaction --databases > /tmp/openstack_databases-`date +%F`.sql

MYSQLDBPASS=$(sudo hiera -c /etc/puppet/hiera.yaml mysql::server::root_password)
mysql -uroot -p$MYSQLDBPASS -s -N -e "SELECT CONCAT('\"SHOW GRANTS FOR ''',user,'''@''',host,''';\"') FROM mysql.user where (length(user) > 0 and user NOT LIKE 'root')" | xargs -n1 mysql -uroot -p$MYSQLDBPASS -s -N -e | sed 's/$/;/' > /tmp/openstack_databases_grants-`date +%F`.sql

sshpass -p 'backup' scp /tmp/openstack_databases*  backup@10.91.113.157:/home/backup/backup_data 
sudo rm /tmp/openstack_databases* 

