alias encodempv='mpv --profile=encode'
alias qaac='wine ~/.wine/drive_c/qaac/qaac.exe'
alias qaac_release=/mnt/hephaestos/qaac/qaac91
alias define='python /home/kageru/programming/mwebster/mwebster.py'
alias nanaone-stream='mpv rtmp://live1.brb.re/live/nanaone'
alias ls=exa
alias du=dua
#alias fzf=sk
alias up='sudo pacman -Syu'
alias in='sudo pacman -S'
alias feg=feh # don’t ask
alias tree='exa --tree'
alias animesync='python /home/kageru/programming/animesync-personal/animesync.py'
#alias autoremove='sudo pacman -R $(pacaur -Qdtq)'
alias nt='alacritty --working-directory $PWD &'
#alias nt='urxvtc -cd $PWD &'
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
alias colorpicker="maim -sot 0 | convert - -resize 1x1\! -format '%[pixel:p{0,0}]' info:-"
alias sv='systemctl'
alias xo='xdg-open'
alias resetgamma='xrandr --output DVI-D-0 --gamma 1:1:1 --output HDMI-1 --gamma 1:1:1 --output HDMI-0 --gamma 1:1:1 --output DP-0 --gamma 1:1:1'
alias texbuild='pdflatex -interaction=nonstopmode'
alias weather='curl wttr.in/hamburg -s | head -n 7 -'
alias weathertoday='curl wttr.in/hamburg -s | head -n 17 -'
alias playdir='for f in ./*; do; mpv $f; done;'
alias mntusb='sudo mount /dev/sdi1 ~/usb'
alias mntphone='simple-mtpfs --device 1 ~/usb'
alias umubs='sudo umount ~/usb'
alias gst='git status'
alias gco='git checkout'
alias gs='git switch'
alias gsc='git switch -c'
alias gr='git restore'
alias gcp='git cherry-pick'
alias gl='git log'
alias blps='~/.steam/steam/steamapps/common/BorderlandsPreSequel/BorderlandsPreSequel'
alias dir2flac='for f in *.wav; do
    ffmpeg -i "$f" -compression_level 12 "`basename "$f" .wav`.flac"
done
for f in *.WAV; do
    ffmpeg -i "$f" -compression_level 12 "`basename "$f" .WAV`.flac"
done;'
alias vpnon='sudo systemctl start openvpn-client@client.service'
alias vpnoff='sudo systemctl stop openvpn-client@client.service'
alias tunnel='vpnoff && vpnon'
alias getip='curl https://canihazip.com/s'

alias config='/usr/bin/git --git-dir=/home/kageru/dotfiles/ --work-tree=/home/kageru'
alias -g ...='../../'           #cd ...
alias -g ....='../../../'       #cd ....
alias -g .....='../../../../'   #cd .....
alias :q='exit'
alias :wq='exit'

alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

# Aliases for SSH connections (mount sshfs, mac IDs for WoL, etc)
[ -f ~/.config/zsh/ssh.sh ] && source ~/.config/zsh/ssh.sh

paste() {
    curl -F"file=@$1" https://p.kageru.moe | xsel -b
}

alias dark='xset dpms force off'
