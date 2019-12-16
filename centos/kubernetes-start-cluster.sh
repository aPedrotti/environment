#!/bin/bash

kubeadm init | grep 
# grep da linha do kubeadm join --token
echo "token salvo em "

echo "Ajustando pastas"
mkdir - &&
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config &&
chown $(id -u):$(id -g) $HOME/.kube/config &&
echo "Ajustado"

echo "Creating Network" &&
export kubever=$(kubectl version | base64 | tr -d '\n') &&
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever" |cat > ~/logs/network$date 

