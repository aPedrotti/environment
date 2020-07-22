# If you come from bash you might have to change your $PATH.

export ZSH="/Users/andre/.oh-my-zsh"
ZSH_THEME="robbyrussell"

HIST_STAMPS="dd/mm/yyyy"
plugins=(
  osx
  git
  brew
  docker
  docker-compose
  history
  vagrant
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

############ LIST OF CUSTOM ALIASES ############
# lista all available aliases
alias aliases='alias -p'

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Folder Navigation
alias l='ls -CF'
alias ll='ls -alhF'
alias ls='ls'
#alias update='sudo -- sh -c "yum update && apt upgrade"'
export HISTTIMEFORMAT='%F %T '
# alias vi='vim:colorscheme bluewery'

# Applications
alias web='cd /var/www/html'
alias guarida='cd ~/Documents/vscode/guarida'

# Git
alias gs='git status'
alias vai='git add . && git commit -m "soh vaiii" && git push origin master'
alias pl='git pull'
alias pom='git push origin master'

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


source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else export EDITOR='atom'
fi
export PATH="$PATH:$HOME/.rvm/bin"
export VAGRANT_HOME="~/Storage/vagrant.d"
export VAGRANT_FORCE_COLOR=true
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andre/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andre/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andre/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andre/Applications/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=/bin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin:/usr/local/opt/ssh-copy-id/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:/Users/andre/Applications:/Users/andre/Applications/google-cloud-sdk/bin:/Users/andre/Applications/istio-1.6.0/bin:/Users/andre/Applications/hashicorp:/usr/local/opt/coreutils/libexec/gnubin:/Users/andre/Library/Python/2.7/bin:/Users/andre/.minishift/cache/oc/v3.11.0/darwin


[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)