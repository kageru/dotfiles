alias encodempv='mpv --profile=encode'
alias qaac='wine ~/.wine/drive_c/qaac/qaac.exe'
alias qaac_release=/mnt/hephaestos/qaac/qaac91
alias define='python /home/kageru/programming/mwebster/mwebster.py'
alias nanaone-stream='mpv rtmp://live1.brb.re/live/nanaone'
alias ls='exa'
alias exat='exa --tree -L 3'
alias animesync='python /home/kageru/programming/animesync-personal/animesync.py'
alias autoremove='sudo pacaur -R $(pacaur -Qdtq)'
export EDITOR=/usr/bin/vim
#alias nt='alacritty --working-directory $PWD &'
alias nt='urxvt -cd $PWD &'
alias ej='udisksctl power-off -b'
alias monitor_on='pactl load-module module-loopback'
alias monitor_off='pactl unload-module module-loopback'
alias eac='wine "/home/kageru/.wine/drive_c/Program Files (x86)/Exact Audio Copy/EAC.exe"'
alias sizeof='expac -H M "%n\t%m" -s'
alias now='date +%H:%M:%S'
alias c='bc <<< '
alias ll='ls -l'
alias la='ls -a'
alias grep="grep --colour"
alias clip='xsel -b'
alias bitrateviewer='wine "/home/kageru/.wine/drive_c/Program Files (x86)/BitrateViewer/BitrateViewer.exe"'
alias colorpicker="maim -st 0 | convert - -resize 1x1\! -format '%[pixel:p{0,0}]' info:-"
alias fixgit='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/git'
alias sv='systemctl'
alias xo='xdg-open'

alias config='/usr/bin/git --git-dir=/home/kageru/dotfiles/ --work-tree=/home/kageru'
alias -g ...='../../'           #cd ...
alias -g ....='../../../'       #cd ....
alias -g .....='../../../../'   #cd .....

alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

# Aliases for SSH connections (raspi, remote server, etc.)
[ -f ~/.config/zsh/ssh.sh ] && source ~/.config/zsh/ssh.sh

