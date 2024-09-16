export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=( 
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

load-kitty-silently(){
	source $ZSH/oh-my-zsh.sh
} &> /dev/null 


#pokemon-colorscripts --no-title -r

   #Cursor changing color after every command
cursor_change_color(){
    hex=$(openssl rand -hex 3)
    echo -ne "\e]12;#$hex\a"
}

function postcmd(){
    cursor_change_color
}

precmd_functions+=(postcmd)

alias todo='vim /mnt/KSS/Studies/todo/todo'
alias todod='cd /mnt/KSS/Studies/todo/'
alias spm='cd /mnt/KSS/Studies/SPM/'
alias rvce='cd /mnt/KSS/Studies/RVCE/'
alias sem='cd /mnt/KSS/Studies/RVCE/4thsem'
alias backups='cd /mnt/KSS/Back_Ups'
alias docs='cd /mnt/KSS/Documents/'
alias scripts='cd ~/scripts'
alias media='cd /mnt/KSS/Media/'
alias songs='cd /mnt/KSS/Media/Songs/'
alias playsongs='mpv /mnt/KSS/Media/Songs/ --shuffle'
alias hypr='cd ~/.config/hypr'
alias zsh='vim ~/.zshrc'
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
alias ttl='rsync -avhPz --update /mnt/kSS/Media/tolisten/* phone:/storage/E0BE-1F10/tolisten'
alias tdu='cd /mnt/KSS/Studies/todo/ && gc && git push -f todo main'
alias tdd='cd /mnt/KSS/Studies/todo/ && git pull todo main'
alias cod='vim /mnt/KSS/Studies/SPM/codes'
alias ref='sudo reflector --country 'India' --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias ubuntuup='sudo apt update && sudo apt upgrade && sudo apt upgrade && sudo apt full-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'
alias lkey='gpg --list-keys --keyid-format long'
alias lskey='gpg --list-secret-keys --keyid-format long'
alias de='bash de'
alias en='bash en'
alias lc='ls -al'
alias dotpush='cd ~/dot-files && gc  &&git push -f dots main'
alias dotpull='cd ~/dot-files && git pull dots main'
alias zshdown='cp ~/dot-files/.zshrc ~/.zshrc && source ~/.zshrc'
alias chgit=" git config --global user.name "Surajk013" && git config --global user.email "surajsinghk013@gmail.com" "
alias cve='rvce && cd CVE'
alias lap='mosh laptop'
alias pn='mosh phone'
alias pc='mosh pc'
alias gnu='rvce && cd ../GNU'
alias neo='neofetch'
alias uwu='uwufetch'
alias fast='fastfetch'
alias gnu='cd /mnt/KSS/Studies/GNU/'
alias pf='pfetch'
alias gc=" git commit -am "$(date '+%Y-%m-%d %H-%M-%S')" "
alias garuda='nmcli connection up "Garuda 2.4Ghz"'
alias ss='scrot -s /mnt/KSS/Media/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png'
alias nl='newlook'
alias ll="ls -al --color=never"
export PATH="$HOME/.local/bin:$PATH"
alias pnl='pkill newlook'




load-kitty-silently
#neo
