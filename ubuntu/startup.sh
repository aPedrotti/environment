#!/bin/bash

# This applies to Ubuntu SO

# Updating packages and repositories
apt-get update -y && apt-get upgrade -y

#Installing main packages
apt install curl snapd snapd-xdg-open git -y

# Installing Git
apt install git -y
# conifguring git
git config --global aPedrotti
cd ~/vscode &&
git clone https://github.com/aPedrotti/Projetos.git &&
mkdir guarida && cd guarida &&
git clone https://github.com/guarida/faqti.git &&
git clone https://github.com/guarida/servers.git &&
git clone https://github.com/guarida/agenciavirtual.git &&
git clone https://github.com/guarida/sgi.git

# Installing VSCode 
echo "installing vscode"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg &&
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ &&
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
snap install --classic code 

# Install fortinet
wget -O - https://repo.fortinet.com/repo/ubuntu/DEB-GPG-KEY | sudo apt-key add - \
&& 
# Add this following to /etc/apt/sources.list
# deb [arch=amd64] https://repo.fortinet.com/repo/ubuntu/ /bionic multiverse \
&&
apt-get update \
&& 
apt install forticlient 


## DOCKER ##
apt install apt-transport-https ca-certificates curl software-properties-common -y &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
apt update &&
apt-cache policy docker-ce &&
apt install docker-ce docker-ce-cli containerd.io -y &&
usermod -aG docker ${USER} &&
docker --version

## Docker Machine
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine

# To enable the docker-machine shell prompt, add $(__docker_machine_ps1) to your PS1 setting in ~/.bashrc.
#PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '

#Bash Completion scripts
base=https://raw.githubusercontent.com/docker/machine/v0.16.0
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done

# Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
chmod +x /usr/local/bin/docker-compose && 
docker-compose --version



# Installing Kubernetes
snap install microk8s --classic
usermod -aG microk8s ${USER}
microk8s.status --wait-ready
microk8s.enable dns dashboard registry


## HASHICORP ##
#Terraform
wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip &&
unzip terraform_0.12.7_linux_amd64.zip &&
mv terraform /usr/local/bin/
terraform --version

