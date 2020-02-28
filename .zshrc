# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/andre/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

complete -C /usr/bin/vault vault

## GCLOUD ##
alias g='gcloud'

