#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap caskroom/cask

# get access to app store
brew install mas
# files from app store 
# The Unarchiver 4.2.2
mas install 425424353 
# Istat Mini 1.1 - Performance controller 
mas install 927292435 
# Moom 3.2.17 - screen position manager
mas install 419330170
#SubnetCalc 1.5
mas install 412946682
# Amphetamine 5.0.2
mas install 937984704

#Magnet 

# Brew utilities
brew install anydesk bash bash-completion2 coreutils curl dash git git-lfs grep nmap openssh teamviewer screen screen vim wget zoom zsh

brew cask install iterm2

# little snitch (firewall)
brew cask install litte-snitch

brew cask install google-chrome forticlient lens

brew install gpg-suite slack discord

# K8s Tools 
brew install derailed/k9s/k9s rke kubectl kubectx kustomize helm stern derailed/popeye/popeye

# Docker
brew cask install docker
brew install docker-compose
brew cask install visual-studio-code macdown vlc

brew install ansible consul packer terraform vagrant


# Personal configurations
# diretório de screenshots
defaults write com.apple.screencapture location /Users/andre/Pictures/screenshots
# seta png para screenshost
defaults write com.apple.screencapture type -string "png"
# desabilita sombra nos screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# solicita senha no protetor de tela imediatamente
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# desabilita o "press-n-hold" em favor da repetição do teclado
defaults write -g ApplePressAndHoldEnabled -bool false

## finder & desktop
# mostra icones adicionais no desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# mostrando arquivos ocultos por default no finder
defaults write com.apple.finder AppleShowAllFiles -bool true
# mostrando extensões de arquivos no finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# mostrando status bar no finder
defaults write com.apple.finder ShowStatusBar -bool true
# mostrando path bar no finder
defaults write com.apple.finder ShowPathbar -bool true
# mostra path POSIX no título da janela
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# mantém pastas no topo da listagem do finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# quando fizer buscas, foca na pasta atual
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# desabilita o warning quando vai mudar a extensão de arquivos
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# evita criar arquivos .DS_Store em volumes e shares em rede
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# usa o 'list view' como padrão no finder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# mostra o diretorio /Library no finder
sudo chflags nohidden /Library

# ativa o hide do dock
defaults write com.apple.dock autohide -bool true

# mostra ip, host e os-version ao clicar em clock na tela de login
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# XCode
#xcode-select --install