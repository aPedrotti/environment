#!/bin/bash

LIST=$1
self="aPedrotti"
# CONSTANTS
homec="$HOME/code/southsystem"
mkdir -p $homec && cd $homec
url="https://github.com"

clone="git clone"
checkoutmaster="git checkout master"
updmaster="git pull origin master"

# REPOSITORIES 
PROJECTD="DVP"
REPOD=("config_httpd" "Devops" "esteira-shared-libraries")
mine=(
    environment
    kubernetes
    Projetos
)


ansible=( 
    geerlingguy/ansible-for-devops
)

kubernetes=(
    geerlingguy/ansible-for-kubernetes
)


getdevops(){
    set -e
    mkdir -p $LIST && cd $LIST
    for x in ${REPO[@]}; do
    repo=$url/$user/$x".git"
        if [ ! -d $x ]; then            
            $clone $repo
        else
            cd $x
            $updmaster
            cd ..
        fi
    done
    cd $homec
}


getesteira(){
    set -e
    mkdir -p $LIST && cd $LIST
    for x in ${REPOE[@]}; do
    url="https://"$USER"@bitbucket.getnet.com.br/scm/$PROJECTE/$x.git"
        if [ ! -d $x ]; then            
            $clone $url
        else
            cd $x
            $updmaster
            cd ..
        fi
    done
    cd $homec
}

getgateway(){
    set -e
    mkdir -p $LIST && cd $LIST
    for x in ${REPOG[@]}; do
        url="https://"$USER"@bitbucket.getnet.com.br/scm/$PROJECTG/$x.git"
        if [ ! -d $x ]; then
            $clone "$url"
        else
            cd $x
            $updmaster
            cd ..
        fi
    done
    cd $homec
}

ALL(){
    getdevops
    getesteira
    getgateway

}

--help(){
    echo "Configured Projects: 'devops' 'esteira' 'gateway' \n
            (example: ./git-clone.sh esteira)"
}

case "$LIST" in
    #ALL)
    #    ALL
    #;;
    devops)
        getdevops
    ;;
    esteira)
        getesteira
    ;;
    gateway)
        getgateway
    ;;
    *) --help
esac
