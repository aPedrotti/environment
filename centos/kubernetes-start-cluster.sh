#!/bin/bash

kubeadm init | grep 
# grep da linha do kubeadm join --token
&& echo "token salvo em " \

&& echo "Ajustando pastas" \
&& mkdir -p $HOME/.kube \
&& cp -i /etc/kubernetes/admin.conf $HOME/.kube/config \
&& chown $(id -u):$(id -g) $HOME/.kube/config \
&& echo "Ajustado" \

&& echo "Creating Network" \
&& kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# Error In the Node
# The connection to the server localhost:8080 was refused - did you specify the right host or port?
mkdir -p $HOME/.kube &&
cp -i /etc/kubernetes/kubelet.conf $HOME/.kube/config &&
chown $(id -u):$(id -g) $HOME/.kube/config
