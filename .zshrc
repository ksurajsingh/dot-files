# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

alias greet='echo "Hello from alias!"'

ZSH_THEME="random"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

function sshere(){
  local n=${1:-1}
  local src='/mnt/KSS/backUps/poco/dcim/screenshots/'

  ls -t "$src" | head -n "$n" | while read -r f; do 
   cp "$src/$f" . 
  done

  echo "copied $n files from SS dir to curDir "
}

function load_silent(){ 
  tmux source-file ~/.config/tmux/.tmux.conf
  source $ZSH/oh-my-zsh.sh 
} &> /dev/null

load_silent

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
# pokemon-colorscripts --no-title -s -r

pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc
#fastfetch
# Set-up icons for files/folders in terminal
# alias ls='eza -a --icons'
alias ls='lsd'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias l='ls -lah'

#change cursor color after each prompt
cursor_change_color(){
  hex=$(openssl rand -hex 3)
  echo -ne "\e]12;#$hex\a"
}

function postcmd(){
  cursor_change_color
}

precmd_functions+=(postcmd)

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory



# # Memories [ Deprecated ]
#
# alias waldown='find ~/Downloads -type f \( -name "*.mp4" -o -name "*.jpeg" -o -name "*.jpg" -o -name "*.png" \) -exec mv {} /mnt/KSS/Media/wallpapers/ \;'
#
# # wholesome
# alias lifeupdate='snapall && notify-send KSS-snapped && phoneup && notify-send phoneup && kssup && notify-send KSSUP && phoneup && notify-send life updated && notify-send upgrading system && archup'
#
# #KSS updates
# alias kssup='pc2lap && lap2pc'
# alias pc2lap='rsync -avUhPz /mnt/KSS/ laptop:/mnt/KSS/ --exclude "*git*" --exclude "*myenv*" --exclude ".btrfssnapshots" --exclude "codes" '
# alias lap2pc='rsync -avhUPz laptop:/mnt/KSS/ /mnt/KSS/ --exclude "*git*" --exclude "*myenv*" --exclude ".btrfssnapshots" --exclude "codes" '
#
# #Phoneupdates
# alias phoneup='dcim2pc && docs2pn && pndocs2pc'
# alias dcim2pc='rsync -avhUPz phone:/storage/D15D-6264/DCIM/Camera/ /mnt/KSS/backUps/poco/dcim/camera/ '
# alias pnss2backups='rsync -avhUPz phone:/storage/emulated/0/DCIM/Screenshots/ /mnt/KSS/backUps/poco/dcim/screenshots/ '
# alias ss2pn='rsync -avhUPz /mnt/KSS/backUps/poco/dcim/screenshots/ phone:/storage/emulated/0/DCIM/Screenshots/ '
# alias sem2pn='rsync -avhUPz --delete /mnt/KSS/Learnings/rvce/6thsem/ phone:/storage/D15D-6264/6thsem/ --exclude "*git*" --exclude "myenv" ' 
# alias pndocs2pc='rsync -avhUPz  phone:/storage/D15D-6264/Documents/ /mnt/KSS/Documents/ '
# alias docs2pn='rsync -avhUPz /mnt/KSS/Documents/  phone:/storage/D15D-6264/Documents/ --exclude "*git*" --exclude "myenv" --exclude "*.zip"' 
# alias songs2pn='rsync -ahUPz /mnt/KSS/Media/songs phone:/storage/D15D-6264/ '
# alias pnsongs2pc='rsync -ahUPz phone:/storage/D15D-6264/songs /mnt/KSS/Media/ '
# alias pnsem2pc='rsync -avhUPz  phone:/storage/D15D-6264/6thsem/ /mnt/KSS/Learnings/rvce/6thsem/ '
# alias tw2pn='rsync -avhUPz /mnt/KSS/Media/towatch/* phone:/storage/D15D-6264/towatch/'
# alias pntw2pc='rsync -avhUPz phone:/storage/D15D-6264/towatch/  /mnt/KSS/Media/towatch/ '
# alias tdu='rsync -avhUPz /mnt/KSS/Learnings/todo/ phone:~/sdc/todo/ '
# alias tdd='rsync -avhUPz phone:~/sdc/todo/ /mnt/KSS/Learnings/todo/ '


# My functions 

# rss stands for recent SS
rss(){
  loc="/mnt/KSS/backUps/poco/dcim/screenshots/"
  ls -t "$loc"  | head -n "$1" | xargs -I {} cp "$loc{}" . 
}



# setting alias for faster workflow



# Rice
alias neo='neofetch'
alias uwu='uwufetch'
alias fast='fastfetch'
alias pf='pfetch'

# Devices
alias lap='mosh laptop'
alias pn='mosh phone'
alias pc='mosh pc'

# Routines
alias archup='yay -Scc && sudo pacman -Scc && sudo pacman -Syu && notify-send -u critical "Pacman-Update [pwd required]" && yay -Syu --needed && notify-send "yay-Updated" || notify-send -u critical "password-required" && echo -e "\n\nArch Successfully Updated\n" '
alias ref='sudo reflector --country 'India' --latest 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syy'

# snapshots
alias snapall='snapmedia && snapdocs && snapstudies && snapbackups'
alias snapstudies='sudo btrfs subvolume snapshot /mnt/KSS/Learnings /mnt/KSS/.btrfssnapshots/Learnings/Learnings_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapdocs='sudo btrfs subvolume snapshot /mnt/KSS/Documents /mnt/KSS/.btrfssnapshots/Documents/Documents_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapbackups='sudo btrfs subvolume snapshot /mnt/KSS/backUps /mnt/KSS/.btrfssnapshots/backUps/backUps_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapmedia='sudo btrfs subvolume snapshot /mnt/KSS/Media /mnt/KSS/.btrfssnapshots/Media/Media_snapshot_$(date +"%Y%m%d_%H%M%S") '

# Git 
alias maingit=" git config --global user.name "ksurajsingh" && git config --global user.email "surajsinghk013@gmail.com" "
alias ictgit=" git config --global user.name "ictttb" && git config --global user.email "ictttb@gmail.com" "
alias gs='git status'
alias gph='git push'
alias gpl='git pull'
alias gl='git log'
alias gck='git checkout'
alias gmg='git merge'
alias ac=" git commit -am "Auto-commit" "
alias gc=" git commit -am "
alias devtomain="gph && gck main && gm dev && gph && gck dev" 
alias dotpush='cd ~/dot-files && ac  && git push -f dots main'
alias dotpull='cd ~/dot-files && git pull dots main'

# Bluetooth
alias enco='bluetoothctl scan on && bluetoothctl connect 2C:FD:B4:7E:65:6A '
alias onbz='pactl set-default-sink bluez_output.2C_FD_B4_7E_65_6A.1'
alias onpc='pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo'
alias speaker='bluetoothctl connect B4:20:53:C3:09:A4'
alias poco='bluetoothctl connect 10:3F:44:8B:06:F2'

# Media
alias towatch='mpv /mnt/KSS/Media/towatch/* --shuffle --fullscreen'
alias towatchd='cd /mnt/KSS/Media/towatch'
alias tolisten='mpv /mnt/KSS/Media/tolisten/* --shuffle'
alias tolistend='cd /mnt/KSS/Media/tolisten/'
alias psongs='songs && mpv "$(fzf)" '

# CLI
alias lkey='gpg --list-keys --keyid-format long'
alias lskey='gpg --list-secret-keys --keyid-format long'
alias zshdown='cp ~/dot-files/.zshrc ~/.zshrc && source ~/.zshrc'
alias garuda='nmcli connection up "Garuda 2.4Ghz"'
alias garuda5='nmcli connection up "Garuda 5Ghz"'
alias poconet='nmcli connection up "POCO M2"'
alias ss='scrot -s /mnt/KSS/backUps/poco/dcim/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png'
alias nl='newlook'
alias pnl='pkill newlook'
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'
alias fzf='fzf --multi '
alias cpu='watch cpupower frequency-info'

# Opening Stuff
alias ran='ranger'
alias calc='deepin-calculator'
alias nv='nvim'
alias open='xdg-open'
alias chrome='google-chrome-stable'
alias zsh='nvim ~/.zshrc'

# Navigation
alias dots='cd ~/dot-files'
alias down='cd ~/Downloads'
alias wall='cd /mnt/KSS/Media/wallpapers/'
alias zshup='cp ~/.zshrc ~/dot-files/.zshrc'
alias sss='cd /mnt/KSS/backUps/poco/dcim/screenshots/ '
alias hkirat='cd /mnt/KSS/Learnings/fsd/mern/harkirathsingh/ '
alias tmp='cd ~/tmp'
alias yt='cd /mnt/KSS/Media/yt/'
alias cwh='cd /mnt/KSS/Learnings/fsd/cwh/ '
alias fsd='cd /mnt/KSS/Learnings/fsd/ '
alias ai='cd /mnt/KSS/Learnings/aiml/ '
alias ops='cd /mnt/KSS/Learnings/devops/ '
alias fun='cd /mnt/KSS/Learnings/fsd/site/fundamentals/ '
alias gng='cd /mnt/KSS/Learnings/fsd/site/fundamentals/gitNgithub/'
alias sec='cd /mnt/KSS/Learnings/cybersec/'
alias diaryd='cd /mnt/KSS/Learnings/fsd/site/futurediary/'
alias site='cd /mnt/KSS/Learnings/fsd/site/ '
alias hms='cd /mnt/KSS/Learnings/fsd/hms/ '
alias dsa='cd /mnt/KSS/Learnings/dsa/'
alias lan='cd /mnt/KSS/Learnings/fsd/site/fundamentals/lan/'
alias lrn='cd /mnt/KSS/Learnings/ '
alias kss='cd /mnt/KSS/ '
alias clips='cd /mnt/KSS/Media/clips/ '
alias todod='cd /mnt/KSS/Learnings/todo/'
alias todo='nvim /mnt/KSS/Learnings/todo/readme.md'
alias rvce='cd /mnt/KSS/Learnings/rvce/'
alias sem='cd /mnt/KSS/Learnings/rvce/7thsem'
alias backups='cd /mnt/KSS/backUps'
alias isos='cd /mnt/KSS/backUps/isos/'
alias vms='cd /mnt/KSS/Learnings/cybersec/vms/'
alias docs='cd /mnt/KSS/Documents/'
alias logs='cd /mnt/KSS/Documents/personal/logs/'
alias scripts='cd ~/scripts'
alias media='cd /mnt/KSS/Media/'
alias songs='cd /mnt/KSS/Media/songs/'
alias hypr='cd ~/.config/hypr'
alias app='cd /mnt/KSS/Learnings/rvce/placements/applications/'
alias intern='cd /mnt/KSS/Learnings/rvce/placements/gotplaced/onetrust/'


# Created by `pipx` on 2024-12-29 05:42:19
export PATH="$PATH:/home/suraj/.local/bin"


# for pyenv's virtualenvs plugin 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias fnf='cd /mnt/KSS/Learnings/fsd/fnf/'
