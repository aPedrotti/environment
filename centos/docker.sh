#!/bin/bash

yum install -y yum-utils device-mapper-persistent-data lvm2 &&\
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&\
dnf install docker-ce --nobest -y &&\
systemctl enable docker.service &&\
systemctl start docker.service &&\ 
systemctl status docker.service

sudo usermod -aG docker $(whoami)