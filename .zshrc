# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

function load_silent(){
  source $ZSH/oh-my-zsh.sh 
} &> /dev/null

load_silent

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc
# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

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


#setting alias for faster workflow


#snapshots
alias snapstudies='sudo btrfs subvolume snapshot /mnt/KSS/Studies /mnt/KSS/.btrfssnapshots/Studies_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapdocs='sudo btrfs subvolume snapshot /mnt/KSS/Documents /mnt/KSS/.btrfssnapshots/Documents_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapbackups='sudo btrfs subvolume snapshot /mnt/KSS/Back_Ups /mnt/KSS/.btrfssnapshots/Back_Ups_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapmedia='sudo btrfs subvolume snapshot /mnt/KSS/Media /mnt/KSS/.btrfssnapshots/Media_snapshot_$(date +"%Y%m%d_%H%M%S") '
alias snapall='snapmedia & snapdocs & snapstudies & snapbackups'

#routinepnbackups
alias routinepn2here='dcim2backups & pnss2backups'
alias routine2pn='ss2pn & pushsongs2pn & spm2pn'

#KSS backups
alias routine2pc='rsync -avhPz --update /mnt/KSS/ pc:/mnt/KSS/ --exclude "*git*" --exclude "*myenv*" --exclude ".btrfssnapshots" & spm2lap'
alias routine2lap='rsync -avhPz --update /mnt/KSS/ laptop:/mnt/KSS/ --exclude "*git*" --exclude "*myenv*" --exclude ".btrfssnapshots" spm2pc'


#photos and screenshots backups
alias dcim2backups='rsync -avhpz --update phone:/storage/F563-C19B/DCIM/Camera/ /mnt/KSS/Back_Ups/POCO/DCIM/Camera/'
alias pnss2backups='rsync -avhPz --update phone:/storage/emulated/0/DCIM/Screenshots/ /mnt/KSS/Back_Ups/POCO/DCIM/Screenshots/'
alias ss2backups='mv ~/Pictures/Screenshots/* /mnt/KSS/Back_Ups/POCO/DCIM/Screenshots/ '
alias ss2pn='rsync -avhPz --update /mnt/KSS/Back_Ups/POCO/DCIM/Screenshots/ phone:/storage/emulated/0/DCIM/Screenshots/ '
alias pushsongs2pn='rsync -avhpz --update /mnt/KSS/Media/Songs/ phone:/storage/F563-C19B/Songs/ '


#SPM update
alias spm2pn='rsync -avhPz --update spiderman.jpg phone:/storage/F563-C19B/SPM/'
alias spm2lap='rsync -avhPz --update spiderman.jpg laptop:/mnt/KSS/Studies/SPM/'
alias spm2pc='rsync -avhPz --update spiderman.jpg pc:/mnt/KSS/Studies/SPM/'

#commoners
alias sdd='cd /mnt/KSS/Studies/ '
alias clips='cd /mnt/KSS/Media/clips/ '
alias todo='nvim /mnt/KSS/Studies/todo/todo'
alias todod='cd /mnt/KSS/Studies/todo/'
alias spm='cd /mnt/KSS/Studies/SPM/'
alias rvce='cd /mnt/KSS/Studies/RVCE/'
alias sem='cd /mnt/KSS/Studies/RVCE/5thsem'
alias backups='cd /mnt/KSS/Back_Ups'
alias docs='cd /mnt/KSS/Documents/'
alias scripts='cd ~/scripts'
alias media='cd /mnt/KSS/Media/'
alias songs='cd /mnt/KSS/Media/Songs/'
alias playsongs='mpv /mnt/KSS/Media/Songs/ --shuffle'
alias hypr='cd ~/.config/hypr'
alias zsh='nvim ~/.zshrc'
alias gs='git status'
alias gph='git push'
alias gpl='git pull'
alias towatch='mpv /mnt/KSS/Media/towatch/* --shuffle'
alias towatchd='cd /mnt/KSS/Media/towatch'
alias tolisten='mpv /mnt/KSS/Media/tolisten/* --shuffle'
alias tolistend='cd /mnt/KSS/Media/tolisten/'
alias enco='bluetoothctl connect 2C:FD:B4:7E:65:6A'
alias speaker='bluetoothctl connect B4:20:53:C3:09:A4'
alias poco='bluetoothctl connect 10:3F:44:8B:06:F2'
alias down='cd ~/Downloads'
alias wallpaper='cd /mnt/KSS/Media/wallpapers/'
alias waldown='find ~/Downloads -type f \( -name "*.mp4" -o -name "*.jpeg" -o -name "*.jpg" -o -name "*.png" \) -exec mv {} /mnt/KSS/Media/wallpapers/ \;'
alias zshup='cp ~/.zshrc ~/dot-files/.zshrc'
alias ran='ranger'
alias calc='deepin-calculator'
alias archup='yay -Scc && sudo pacman -Scc && sudo pacman -Syu'
alias ttw='rsync -achPz --update /mnt/KSS/Media/towatch/* phone:/storage/E0BE-1F10/towatch/'
alias tdu='cd /mnt/KSS/Studies/todo/ && ac && git push -f todo main'
alias tdd='cd /mnt/KSS/Studies/todo/ && git pull todo main'
alias cod='nvim /mnt/KSS/Studies/SPM/codes'
alias ref='sudo reflector --country 'India' --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias ubuntuup='sudo apt update && sudo apt upgrade && sudo apt upgrade && sudo apt full-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'
alias lkey='gpg --list-keys --keyid-format long'
alias lskey='gpg --list-secret-keys --keyid-format long'
alias de='bash de'
alias en='bash en'
alias lc='ls -al'
alias dotpush='cd ~/dot-files && ac  &&git push -f dots main'
alias dotpull='cd ~/dot-files && git pull dots main'
alias zshdown='cp ~/dot-files/.zshrc ~/.zshrc && source ~/.zshrc'
alias chgit=" git config --global user.name "Surajk013" && git config --global user.email "surajsinghk013@gmail.com" "
alias cve='rvce && cd CVE'
alias lap='mosh laptop'
alias pn='mosh phone'
alias pc='mosh pc'
alias neo='neofetch'
alias uwu='uwufetch'
alias fast='fastfetch'
alias pf='pfetch'
alias ac=" git commit -am "Auto-commit" "
alias gc=" git commit -am "
alias garuda='nmcli connection up "Garuda 2.4Ghz"'
alias ss='scrot -s /mnt/KSS/Media/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png'
alias nl='newlook'
alias ll="ls -al --color=never"
alias pnl='pkill newlook'
alias nv=nvim

