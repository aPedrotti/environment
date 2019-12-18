#!/bin/bash
# Comentar linha do swap no /etc/fstab e então reinciiar

swapoff -a && \
setenforce 0 && \
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux && \

echo "Configuring Repository" && \
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF
&& \
echo "Disabling IPv6" && \
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
&& \

#Setup firewall rules for kubernetes
echo "Setting up firewall rules" && \
firewall-cmd --permanent --add-port=6443/tcp &&\
firewall-cmd --permanent --add-port=2379-2380/tcp && \
firewall-cmd --permanent --add-port=10250/tcp && \
firewall-cmd --permanent --add-port=10251/tcp && \
firewall-cmd --permanent --add-port=10252/tcp && \
firewall-cmd --permanent --add-port=10255/tcp && \
firewall-cmd --reload && \
modprobe br_netfilter && \
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables && \

echo "INSTALLING KUBEADM KUBECTL KUBELET " && \
yum install -y kubeadm kubectl kubelet kubernetes-cni --disableexcludes=kubernetes && \
systemctl enable --now kubelet && systemctl start kubelet && \

echo "CONFIGURING AUTOCOMPLETE" && \
yum install -y bash-completion && \
source <(kubectl completion bash) && \
echo "# Baixar images de suporte para outras APIs do kubernets" && \
kubeadm config images pull && \

echo "Concluido. # Comentar linha do swap no /etc/fstab e então reinciiar. Então DALE NO KUBEADM INIT" \
function _pause() {
    read -p "$*"
}
_pause 'press ENTER '
