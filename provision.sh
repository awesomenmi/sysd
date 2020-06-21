#!/bin/bash

setenforce 0

#monitor

cp /vagrant/monitor/monitor.sh /opt/monitor.sh
chmod +x /opt/monitor.sh
cp /vagrant/monitor/monitor.service /etc/systemd/system/monitor.service
cp /vagrant/monitor/monitor.timer /etc/systemd/system/monitor.timer
cp /vagrant/monitor/monitor.conf /etc/sysconfig/monitor
cp /vagrant/monitor/monitor.log /var/log/monitor.log

systemctl start monitor.timer

#httpd

yum install -y httpd

sed -i '/Listen 80/d' /etc/httpd/conf/httpd.conf

cp /vagrant/httpd/httpd@.service /etc/systemd/system

cp /vagrant/httpd/httpd-first /etc/sysconfig
cp /vagrant/httpd/httpd-second /etc/sysconfig

cp /vagrant/httpd/template.conf /etc/httpd/conf.d/template.conf

systemctl start httpd@first.service
systemctl start httpd@second.service

#jira

yum install wget -y
yum install java-1.8.0-openjdk -y

echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.el7_8.x86_64" >> /etc/enviroment
source /etc/enviroment

wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-8.5.5.tar.gz

mkdir /opt/jira
tar -xzf atlassian-jira-software-8.5.5.tar.gz -C /opt/jira --strip-components=1

mkdir /var/jira
export JIRA_HOME=/var/jira

sed -i 's#jira.home =#jira.home =/var/jira#g' /opt/jira/atlassian-jira/WEB-INF/classes/jira-application.properties

touch /lib/systemd/system/jira.service
chmod 664 /lib/systemd/system/jira.service

cp /vagrant/jira/jira.service /lib/systemd/system/jira.service
chmod 664 /lib/systemd/system/jira.service

systemctl enable jira
systemctl start jira 


