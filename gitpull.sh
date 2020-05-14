#!/bin/zsh
mkdir -p ~/vscode
cd ~/

#Structure
guarida=~/vscode/guarida
agenciavirtual=~/vscode/guarida/agenciavirtual
sgi=~/vscode/guarida/sgi

updmaster="git pull origin master"
checkoutmaster="git checkout master"
for folder in x; do
    if [ ! -d $ ]; then
    mkdir -p $
else [
    cd $agenciavirtual
    $checkoutmaster
    $updmaster
]
fi

mkdir -p ~/vscode/guarida
git clone https://github.com/guarida/agenciavirtual.git
git clone https://github.com/guarida/condominium-financial.git
git clone https://github.com/guarida/img.guarida.com.br.git
git clone https://github.com/guarida/guarida.com.br.git
git clone https://github.com/guarida/gua.rs.git
git clone https://github.com/guarida/servers.git
git clone https://github.com/guarida/sgi.git
