#!/bin/bash

yum update -y
yum upgrade -y
yum install -y apt-transport-https ca-certificates curl git hyperv-daemons nfs-common software-properties-common vim wget

echo "getting newer epel-release" 
wget dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm
rpm -ihv epel-release-7-12.noarch.rpm
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

echo  "Adding main aliases"
cat > ~/.bashrc <<EOF
# Folder Navigation
PS1='\u@\h:\w\$ '
alias l='ls -CF'
alias ll='ls -alhF --color=auto'
alias ls='ls --color=auto'
alias update='sudo -- sh -c "yum update -y && yum upgrade -y"'

# SERVICES
alias sr='systemctl restart'
alias ss='systemctl status'
alias st='systemctl start'
alias sp='systemctl stop'

## DOCKER ##
alias d='docker'
alias dcup='docker-compose up -d'
alias dcd='docker-compose down'
alias de='docker exec -it'
alias ds='docker ps'
alias dsl='docker service ls'
alias di='docker images'
alias dip='docker image prune -a'
alias dcup='docker-compose up -d'
alias dcd='docker-compose down'
alias dns='docker network ls'
alias dl='docker logs'
alias dr='docker restart'

## KUBERNETES ##
alias checkk8s='echo "## NODES ##" && kubectl get no && \
echo "## PODS ##" && kubectl get po -o wide && \
echo "## DEPLOYS ##" && kubectl get deploy && \
echo "## NAMESPACES ##" && kubectl get ns && \
echo "## RESOURCES ##" && kubectl get rs && \
echo "## SERVICES ##" && kubectl get svc && kubectl get ing'
alias k='kubectl'
alias kga='kubectl get all'
alias kno='kubectl get node -o wide'
alias kpo='kubectl get po -o wide'
alias kdp='kubectl get deploy'
alias king='kubectl get ing'
alias kns='kubectl get ns'
alias krs='kubectl get rs'
alias kcns='kubectl get sa default -o jsonpath='{.metadata.namespace}''
alias ksvc='kubectl get svc'
alias kctx='kubectl config set-context $(kubectl config current-context) --namespace'
alias kc='kubectl create'
alias kd='kubectl delete'
alias kds='kubectl describe'
alias kx='kubectl exec -it $1'
alias kl='kubectl logs'

complete -C /usr/bin/vault vault

EOF
. ~/.bashrc

## CENTOS 8 - latest epel
# wget dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/e/epel-release-8-7.el8.noarch.rpm && rpm -ihv epel-release-8-7.el8.noarch.rpm