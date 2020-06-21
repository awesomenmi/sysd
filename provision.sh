#!/bin/bash

yum update -y
yum install -y vim

setenforce 0

cp /vagrant/monitor/monitor.sh /opt/monitor.sh
chmod +x /opt/monitor.sh
cp /vagrant/monitor/monitor.service /etc/systemd/system/monitor.service
cp /vagrant/monitor/monitor.timer /etc/systemd/system/monitor.timer
cp /vagrant/monitor/monitor.conf /etc/sysconfig/monitor
cp /vagrant/monitor/monitor.log /var/log/monitor.log

systemctl start monitor.timer

yum install -y httpd

sed -i '/Listen 80/d' /etc/httpd/conf/httpd.conf

cp /vagrant/httpd/httpd@.service /etc/systemd/system

cp /vagrant/httpd/httpd-first /etc/sysconfig
cp /vagrant/httpd/httpd-second /etc/sysconfig

cp /vagrant/httpd/template.conf /etc/httpd/conf.d/template.conf

systemctl start httpd@first.service
systemctl start httpd@second.service
