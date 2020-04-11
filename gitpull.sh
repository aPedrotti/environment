#!/bin/zsh
mkdir -p ~/vscode
cd ~/

#Structure
guarida_folder=~/vscode/guarida
agenciavirtual=~/vscode/guarida/agenciavirtual
updmaster="git pull origin master"
checkoutmaster="git checkout master"
if [ ! -d $MOUNT_NAS_SGIFTP ]; then
    mkdir -p $MOUNT_NAS_SGIFTP
else [
    cd $agenciavirtual
    $checkoutmaster
    $updmaster
]
fi

mkdir -p ~/vscode/guarida
git clone https://github.com/guarida/sgi.git
https://github.com/guarida/condominium-financial.git
https://github.com/guarida/agenciavirtual.git
https://github.com/guarida/guarida.com.br.git
https://github.com/guarida/gua.rs.git
https://github.com/guarida/servers.git
https://github.com/guarida/img.guarida.com.br.git
