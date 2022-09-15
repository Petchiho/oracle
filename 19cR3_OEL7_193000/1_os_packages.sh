#!/bin/bash

echo "******************************************************************************"
echo "Firewall." `date`
echo "******************************************************************************"
systemctl stop firewalld
systemctl disable firewalld

echo "******************************************************************************"
echo "SELinux." `date`
echo "******************************************************************************"
sed -i -e "s|SELINUX=enabled|SELINUX=permissive|g" /etc/selinux/config
setenforce permissive


echo ""
echo "*******************************************"
echo " Install OS Packages." `date`           
echo "*******************************************"
echo "nameserver 192.168.0.1" >> /etc/resolv.conf
echo ""

yum install -y yum-utils zip unzip
yum install -y oracle-database-preinstall-19c
