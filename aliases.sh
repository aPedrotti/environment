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


############ LIST OF CUSTOM ALIASES ############

# lista all available aliases
alias aliases='alias -p'

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Folder Navigation
PS1='\u@\h:\w\$ '
alias l='ls -CF'
alias ll='ls -alhF --color=auto'
alias ls='ls --color=auto'
#alias update='sudo -- sh -c "yum update && apt upgrade"'
export HISTTIMEFORMAT='%F %T '
# alias vi='vim:colorscheme bluewery'

# SERVICES
alias sr='systemctl restart'
alias ss='systemctl status'
alias st='systemctl start'
alias sp='systemctl stop'

# Applications
alias web='cd /var/www/html'
alias guarida='cd ~/Documents/vscode/guarida'

# Git
alias gs='git status'
alias vai='git add . && git commit -m "soh vaiii" && git push origin master'

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
alias kno='kubectl get node -o wide'
alias kpo='kubectl get pod -o wide'
alias kpoc='kubectl get po -o wide -l app=cron'
alias kdp='kubectl get deploy'
alias king='kubectl get ing'
alias kns='kubectl get ns'
alias kgs='kubectl get secrets'
alias krs='kubectl get rs'
alias kcns='kubectl get sa default -o jsonpath='{.metadata.namespace}''
alias ksvc='kubectl get svc'
alias kgs='kubectl get secrets'
alias kctx='kubectl config set-context $(kubectl config current-context) --namespace'
alias kc='kubectl create'
alias kd='kubectl delete'
alias kds='kubectl describe'
alias kx='kubectl exec -it $1'
alias kl='kubectl logs'

complete -C /usr/bin/vault vault

## GCLOUD ##
alias g='gcloud'


# Istio
#export PATH="$PATH:/root/istio-1.3.0/bin"

# Desfazer
#unalias NAME


## COPY UP TO HERE ##
# . ~/.bashrc

EOF
