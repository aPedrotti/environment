#!/bin/bash

yum install -y yum-utils device-mapper-persistent-data lvm2 && \
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
yum install docker-ce -y -y && \
usermod -aG docker $(whoami) && \
systemctl enable docker.service && \
systemctl start docker.service && \
systemctl status docker.service
