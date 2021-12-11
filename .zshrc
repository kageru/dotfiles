export GOPATH=~/go
export PATH=$PATH:~/bin:~/go/binA:/opt/devkitpro/devkitARM/bin:/opt/devkitpro/tools/bin:~/.local/bin
export RUSTFLAGS="-C target-cpu=native"
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
#export PAGER=nvimpager

[ -f ~/.config/zsh/aliases.sh ] && source ~/.config/zsh/aliases.sh

SAVEHIST=100000
HISTFILE=~/.zhistory
HISTSIZE=100000

setopt appendhistory

autoload -Uz vcs_info
autoload -U colors && colors
zstyle ':vcs_info:*' stagedstr "${fg_blue}?"
zstyle ':vcs_info:*' unstagedstr "${fg_brown}?"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git

# no longer needed because starship handles the git stuff
# precmd () {
    #if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        #zstyle ':vcs_info:*' formats "${fg_green} ${fg_normal}%b%c%u${at_normal}"
    #} else {
        #zstyle ':vcs_info:*' formats "${fg_green} ${fg_normal}%b%c%u${fg_red}!${at_normal}"
    #}
    #vcs_info
#}

#setopt prompt_subst

# I usually change the hostname color between my systems
hostcolor="4"
bgcolor="16"
eval "$(starship init zsh)"
#PROMPT="%(!.%F{3}[%F{1}%n%F{3}@%F{$hostcolor}%m %F{3}%c%F{5}\${vcs_info_msg_0_}%F{3}] %(?/%F{2}/%F{1})#.\
#%F{1}[%F{3}%n%F{1}@%F{$hostcolor}%m %F{5}%c%F{4}\${vcs_info_msg_0_}%F{1}] %(?/%F{2}/%F{1}))%f "

# the same prompt without git/vcs stuff
#PROMPT="%(!.%F{3}[%F{1}%n%F{3}@%F{$hostcolor}%m %F{3}%c%F{5}%F{3}] %(?/%F{2}/%F{1})#.%F{1}[%F{3}%n%F{1}@%F{$hostcolor}%m %F{146}%c%F{111}%F{1}] %(?/%F{2}/%F{1})Δ)%f "

autoload -Uz compinit
compinit

export WINEDEBUG=-all

# Get completion above command line
setopt noalwayslastprompt
setopt list_types
setopt complete_in_word

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  ssh-add ~/.ssh/git
  ssh-add ~/.ssh/aur_ecdsa
  ssh-add ~/.ssh/maria
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

ZSHCACHEDIR=/tmp/$USER-zsh-cache

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-suffixes true
# This line does the non-prefix matching magic
zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

setopt nonomatch

source /usr/share/fzf/key-bindings.zsh
