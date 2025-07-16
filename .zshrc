# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="random"

# Add or check these lines
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
  zsh-navigatoin-tools
)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
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
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

    #Cursor changing color after every command
cursor_change_color(){
    hex=$(openssl rand -hex 3)
    echo -ne "\e]12;#$hex\a"
}

function postcmd(){
    cursor_change_color
}

precmd_functions+=(postcmd)

java() {
  javac "$1.java" && java "$1"
}

alias zshup='rsync -avhPz --update ~/.zshrc ~/dot-files/'
alias zshdown='rsync -avhPz --update ~/dot-files/ ~/.zshrc'
alias dotpush='cd ~/dot-files/ && ac && gph'
alias sdc='cd /storage/D15D-6264/ '
alias pushsongs2pc='rsync -avhPz --update /storage/D15D-6264/Songs/ pc:/mnt/KSS/Media/Songs/ '
alias pushsongs2lap='rsync -avhPz --update /storage/D15D-6264/Songs/ pc:/mnt/KSS/Media/Songs/ '
alias spm2lap='rsync -avhPz --update .spiderman.jpg laptop:/mnt/KSS/.btrfssnapshots/.spm/'
alias spm2pc='rsync -avhPz --update .spiderman.jpg pc:/mnt/KSS/.btrfssnapshots/.spm/'
alias intstr='cd /storage/emulated/0/'
alias playsongs='mpv /storage/D15D-6264/songs/ --shuffle'
alias psongs='cd /storage/D15D-6264/songs/ && mpv "$(fzf)" '
alias songs='cd /storage/D15D-6264/songs/'
alias todo='nvim ~/sdc/todo/todo.md'
alias todod='cd ~/sdc/todo'
alias spm='cd ~/.spm/'
alias de='bash de'
alias tmp='cd ~/tmp/'
alias docs='cd /storage/D15D-6264/Documents/ '
alias en='bash en'
alias ran='ranger'
alias rvce='cd /storage/D15D-6264/rvce/'
alias sem='cd /storage/D15D-6264/6thsem/'
alias zsh='nvim ~/.zshrc'
alias gs='git status'
alias towatch='mpv /storage/D15D-6264/towatch/* --shuffle'
alias towatchd='cd /storage/D15D-6264/towatch/'
alias tolisten='mpv /storage/D15D-6264/tolisten/* --shuffle'
alias tolistend='cd /storage/D15D-6264/tolisten/'
alias down='cd /storage/emulated/0/Download/'
alias fu='pkg update && pkg upgrade && apt update && apt upgrade && pkg autoclean && apt autoclean & apt autoremove'
alias sdc='cd  /storage/D15D-6264'
alias clips='cd /storage/D15D-6264/clips/ '
alias cod='nvim ~/.spm/.codes'
alias ac=" git commit -am  "Auto commit" "
alias gc=" git commit -am "
alias gph='git push'
alias gpl='git pull'
alias nv='nvim'
alias tdu="rsync -avhUPz ~/sdc/todo/ pc:/mnt/KSS/Learnings/todo/ "
alias tdd="rsync -avhUPz pc:/mnt/KSS/Learnings/todo/ ~/sdc/todo "
alias pc='mosh pc'
alias lap='mosh laptop'
alias neo='neofetch'

export EDITOR=nvim
export VISUAL=nvim

fastfetch
