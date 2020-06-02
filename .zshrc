export GOPATH=~/go
export PATH=$PATH:~/bin:~/go/bin
export RUSTFLAGS="-C target-cpu=native"
#export PAGER=nvimpager

[ -f ~/.config/zsh/aliases.sh ] && source ~/.config/zsh/aliases.sh

SAVEHIST=100000
HISTFILE=~/.zhistory
HISTSIZE=100000

setopt appendhistory

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

autoload -Uz vcs_info
autoload -U colors && colors
zstyle ':vcs_info:*' stagedstr "${fg_blue}?"
zstyle ':vcs_info:*' unstagedstr "${fg_brown}?"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git

precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats "${fg_green} ${fg_normal}%b%c%u${at_normal}"
    } else {
        zstyle ':vcs_info:*' formats "${fg_green} ${fg_normal}%b%c%u${fg_red}!${at_normal}"
    }
    vcs_info
}

setopt prompt_subst

# I usually change the hostname color between my systems
hostcolor="4"
bgcolor="16"
PROMPT="%(!.%F{3}[%F{1}%n%F{3}@%F{$hostcolor}%m %F{3}%c%F{5}\${vcs_info_msg_0_}%F{3}] %(?/%F{2}/%F{1})#.\
%F{1}[%F{3}%n%F{1}@%F{$hostcolor}%m %F{5}%c%F{4}\${vcs_info_msg_0_}%F{1}] %(?/%F{2}/%F{1}))%f "

# the same prompt without git/vcs stuff
#PROMPT="%(!.%F{3}[%F{1}%n%F{3}@%F{$hostcolor}%m %F{3}%c%F{5}%F{3}] %(?/%F{2}/%F{1})#.%F{1}[%F{3}%n%F{1}@%F{$hostcolor}%m %F{146}%c%F{111}%F{1}] %(?/%F{2}/%F{1})Δ)%f "

autoload -Uz compinit
compinit

export WINEDEBUG=-all

# Get completion above command line
setopt noalwayslastprompt
setopt list_types
setopt complete_in_word
setopt autocd

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  ssh-add ~/.ssh/git
  ssh-add ~/.ssh/aur_ecdsa
  ssh-add ~/.ssh/maria
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# disclaimer: I blatantly copied all of this without actually knowing what it does. ¯\_(ツ)_/¯

ZSHCACHEDIR=/tmp/$USER-zsh-cache

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-suffixes true
# This line does the non-prefix matching magic
zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
#zstyle ':completion:*' preserve-prefix '//[^/]##/'
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path $ZSHCACHEDIR
#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*'   force-list always
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command pids4kill
#zstyle ':completion:::::' completer _complete _approximate
#zstyle ':completion:*:approximate:*' max-errors 2
#zstyle ':completion:*' completer _complete _prefix
#zstyle ':completion::prefix-1:*' completer _complete
#zstyle ':completion:incremental:*' completer _complete _correct
#zstyle ':completion:predict:*' completer _complete # Completion caching
#zstyle ':completion::complete:*' use-cache 1
#zstyle ':completion::complete:*' cache-path $ZSHCACHEDIR/$HOST # Expand partial paths
#zstyle ':completion:*:functions' ignored-patterns '_*'
#zstyle ':completion:*' squeeze-slashes 'yes' # Include non-hidden directories in globbed file completions
#zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # Separate matches into groups
#zstyle ':completion:*:matches' group 'yes' # Describe each match group.
#zstyle ':completion:*:descriptions' format "%B---- %d%b" # Messages/warnings format
#zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
#zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b' # Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

setopt nonomatch

source /usr/share/fzf/key-bindings.zsh

#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"
#~/.config/base16-shell/scripts/base16-onedark.sh
