# Oh-My-Zsh Configuration
export ZSH=~/.oh-my-zsh 	#Path to your oh-my-zsh installation.
ZSH_THEME="customagnoster"	#Set the theme
CASE_SENSITIVE="false" 		#Case-sensitive completition
DISABLE_AUTO_UPDATE="false" 	#Auto update
DISABLE_LS_COLORS="false" 	#Colors for ls
DISABLE_AUTO_TITLE="true" 	#set the terminal title automatically
COMPLETION_WAITING_DOTS="false" #I don't like the dots
HIST_STAMPS="dd/mm/yyyy"	#History timestamps
ZSH_CUSTOM=~/.customzsh 	#Set my custom zsh folder
plugins=(git) 			#Which plugins to load
source $ZSH/oh-my-zsh.sh 	#Source the oh-my-zsh file

# Zsh configuration

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt appendhistory autocd beep notify
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# User configuration
export MANPATH="/usr/local/man:$MANPATH" 	#Manpat variable
export ARCHFLAGS="-arch x86_64" 		#Compilation flags
export SSH_KEY_PATH="~/.ssh/rsa_id" 		#SSH Key
export DEFAULT_USER=$USER 			#Default User
export VIRTUAL_ENV_DISABLE_PROMPT="true" 	#Disable virtual env prompt
export DEVKITPRO=~/.devkitPro 			#Devkit variable
export DEVKITARM=${DEVKITPRO}/devkitARM 	#DevkitARM variable
export GPG_TTY=$(tty)				#Add gpg
export ANDROID_HOME=~/Android/Sdk		#Android enviroment
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set personal aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias testColors="~/.zfuncs/read_colors"
alias neofetch="neofetch --cpu_speed off --cpu_brand off --gpu_brand off --block_range 0 15 --block_width 4 --shell_path on --shell_version off"
alias dia="dia --integrated"

#set the distibution
if [ -n "$(command -v lsb_release)" ]; then
	export DISTRO=$(lsb_release -s -d | tr -d '="')
elif [ -f "/etc/os-release" ]; then
	export DISTRO=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
elif [ -f "/etc/debian_version" ]; then
	export DISTRO="Debian $(cat /etc/debian_version)"
elif [ -f "/etc/redhat-release" ]; then
	export DISTRO=$(cat /etc/redhat-release)
else
	export DISTRO="$(uname -s) $(uname -r)"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vi'
else
	export EDITOR='vim'
fi

#zsh functions
fpath=(
    ~/.zfuncs
    ~/.zfuncs/**/*~*/(CVS)#(/N)
    "${fpath[@]}"
)

#virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
if [[ $DISTRO =~ "^Arch" ]]; then
	source /usr/bin/virtualenvwrapper.sh;
else
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh;
fi
