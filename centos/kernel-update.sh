#!/bin/bash
echo "# UPDATING KERNEL #"
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
yum --enablerepo=elrepo-kernel install kernel-ml -y
echo " Here is all your installed kernels: "
echo "Updating inicialization to the newer one: "
grub2-editenv list
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
