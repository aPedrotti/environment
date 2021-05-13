# Permanente
# vim ~/.bashrc

# Na sessão
# vim ~/.bash_aliases

#Bash – ~/.bashrc
#ZSH – ~/.zshrc
#Fish – ~/.config/fish/config.fish
###

####################################
######### UBUNTU DEFAULTS ##########
####################################
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


############ LIST OF CUSTOM ALIASES ############s

# lista all available aliases
alias aliases='alias -p'

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Folder Navigation
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias l='ls -CF'
alias ll='ls -alhF --color=auto'
alias ls='ls --color=auto'
export HISTTIMEFORMAT='%F %T '
# alias vi='vim:colorscheme bluewery'
alias hosts='sudo vim /etc/hosts'

## DOCKER ##
alias d='docker'
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
alias kctl='microk8s.kubectl'
# PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '


## KUBERNETES ##
alias ck8s='echo "## NODES ##" && kubectl get no \
&& echo "## NAMESPACES ##" && kubectl get ns \
&& echo "## RESOURCES ##" && kubectl get rs \
&& echo "## DEPLOYS ##" && kubectl get deploy \
&& echo "## PODS ##" && kubectl get po -o wide \
&& echo "## SERVICES ##" && kubectl get svc \
&& echo "## INGRESS ##" && kubectl get ing'
alias k='kubectl'
alias ka='kubectl apply -f'
alias kg='kubectl get'
alias kga='kubectl get all'
alias kcm='kubectl get configmap'
alias kcj='kubectl get cronjobs'
alias kgds='kubectl get daemonsets'
alias kno='kubectl get node -o wide'
alias kpo='kubectl get pod -o wide'
alias kpoc='kubectl get po -o wide -l app=cron'
alias kdp='kubectl get deploy'
alias king='kubectl get ing'
alias kns='kubectl get ns'
alias kgs='kubectl get secrets'
alias krs='kubectl get rs'
alias kcns='kubectl get sa default -o jsonpath='{.metadata.namespace}''
alias kgw='kubectl get gw'
alias kvs='kubectl get vs'
alias ksvc='kubectl get svc'
alias kgs='kubectl get secrets'
alias kctx='kubectl config set-context $(kubectl config current-context) --namespace'
alias kc='kubectl create'
alias kd='kubectl delete'
alias kds='kubectl describe'
alias kx='kubectl exec -it $1'
alias kl='kubectl logs'


# Test servers
alias ssh100='ssh root@10.10.10.100'
alias ssh101='ssh root@10.10.10.101'
alias ssh102='ssh root@10.10.10.102'
alias ssh103='ssh root@10.10.10.103'
alias ssh104='ssh root@10.10.10.104'
alias ssh105='ssh root@10.10.10.105'
alias ssh106='ssh root@10.10.10.106'
alias ssh107='ssh root@10.10.10.107'

# SSH
alias ssh35='ssh root@10.10.10.35'
alias ssh36='ssh root@10.10.10.36'
alias ssh158='ssh andre.pedrotti@10.10.10.158'
alias ssh186='ssh root@10.10.10.186 -p 2512'
alias ssh180='ssh root@10.10.10.180'
alias sshawsapp='ssh -i ~/Documentos/guarida-site.pem ec2-user@guarida.com.br'
alias sshawsdb='ssh -i ~/Documentos/guarida-site.pem ec2-user@dbmy.guarida.com.br'
alias sshawsimg='ssh -i ~/Documentos/guarida-site.pem ec2-user@img.guarida.com.br'
#GCP
alias sshdmp2='gcloud beta compute ssh --zone "us-central1-a" "mysql8-p02" --project "guarida-imoveis"'
alias sshsql1='gcloud beta compute ssh --zone "us-central1-a" "mysql-server1" --project "guarida-imoveis"'
alias sshsql2='gcloud beta compute ssh --zone "us-central1-a" "mysql-server2" --project "guarida-imoveis"'
alias sshsql3='gcloud beta compute ssh --zone "us-central1-a" "mysql-server3" --project "guarida-imoveis"'
alias sshsql4='gcloud beta compute ssh --zone "us-central1-a" "mysql-server4" --project "guarida-imoveis"'
alias sshpg='gcloud beta compute ssh --zone "us-central1-a" "postgresql-server1" --project "guarida-imoveis"'
alias sshnfs='gcloud beta compute ssh --zone "us-central1-a" "nfs-server" --project "guarida-imoveis"'
alias sshweb='gcloud beta compute ssh --zone "us-central1-a" "webserver-p01" --project "guarida-imoveis" --ssh-flag="-p 2512"'
alias sshmongo='gcloud beta compute ssh --zone "southamerica-east1-c" "mongodb-1-server-1" --project "guarida-imoveis"'
alias sshlog='gcloud compute ssh log-server --zone us-central1-a --project guarida-imoveis'

# SERVICES
alias sr='systemctl restart'
alias ss='systemctl status'
alias st='systemctl start'
alias sp='systemctl stop'

# Folders link
alias www='cd /var/www/html'
alias guarida='cd ~/Documents/vscode/guarida'
alias projetos='cd ~/Documents/vscode/Projetos'

# Git
alias gs='git status'
alias ga='git add -A'
alias gm='git commit -m'
alias vaiii='git add . && git commit -m "soh vaiii" && git push origin master'
alias vem='git pull origin master'
alias gp='git pull origin'
alias gps='git push origin'


# HASHICORP
#Terraform
alias tf="terraform"
alias tfi="terraform init"
alias tfc="terraform console"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfs="terraform show"

#Vault
complete -C /usr/bin/vault vault

## GCLOUD ##
alias g='gcloud'


#export PATH=/bin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin:/usr/local/opt/ssh-copy-id/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:/Users/andre/Applications/google-cloud-sdk/bin:/Users/andre/Applications/istio-1.6.0/bin:/Users/andre/Applications/hashicorp
export PATH=/bin:
/usr/bin:
/usr/local/bin:
/usr/sbin:
/sbin:
/usr/local/opt/ssh-copy-id/bin:
/Library/Frameworks/Python.framework/Versions/3.7/bin:
/Users/andre/Applications/google-cloud-sdk/bin:
/Users/andre/Applications/istio-1.6.0/bin:
/Users/andre/Applications/hashicorp
# Desfazer
#unalias NAME


## COPY UP TO HERE ##
# . ~/.bashrc

EOF
