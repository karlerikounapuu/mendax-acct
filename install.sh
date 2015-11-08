yum install syslog-ng
yum install php
yum install php-sqlite3
yum install freeradius-utils
rm -rf /var/radius/
mv radius /var
chmod -R a+x /var/radius/
rm -rf /etc/syslog-ng/syslog-ng.conf
mv syslog-ng/syslog-ng.conf /etc/syslog-ng/
mkdir /mnt/ramdisk
mount -t tmpfs -o size=256m tmpfs /mnt/ramdisk
echo -e "tmpfs       /mnt/ramdisk tmpfs   nodev,nosuid,noexec,nodiratime,size=256m   0 0\n" >> /etc/fstab
service syslog-ng stop
service syslog-ng start
