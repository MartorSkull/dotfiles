# Oh-My-Zsh Configuration
export ZSH=/usr/share/oh-my-zsh       # Path to your oh-my-zsh installation.
ZSH_THEME="customagnoster"            # Set the theme
CASE_SENSITIVE="false"                # Case-sensitive completition
DISABLE_AUTO_UPDATE="true"            # Do not auto update (using aur)
DISABLE_LS_COLORS="false"             # Colors for ls
DISABLE_AUTO_TITLE="true"             # Set the terminal title automatically
COMPLETION_WAITING_DOTS="false"       # I don't like the dots
HIST_STAMPS="%d/%m/%y %T"             # History timestamps
ZSH_CUSTOM=~/.customzsh               # Set my custom zsh folder
plugins=(git                          # Which plugins to load
	bgnotify
    )
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh  # ZSH Cache for system-wide install
[ ! -d $ZSH_CACHE_DIR ] && mkdir $ZSH_CACHE_DIR   # Create the cache folder
source $ZSH/oh-my-zsh.sh              # Source the oh-my-zsh file

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
export MANPATH="/usr/local/man:$MANPATH"    # Manpath variable
export ARCHFLAGS="-arch x86_64"             # Compilation flags
export SSH_KEY_PATH="~/.ssh/rsa_id"         # SSH Key
export DEFAULT_USER=$USER                   # Default User
export VIRTUAL_ENV_DISABLE_PROMPT="true"    # Disable virtual env prompt
export GPG_TTY=$(tty)                       # Add gpg
export EDITOR='nvim'                        # Preferred editor
[ -f "$HOME/.env" ] && source $HOME/.env

# Set personal aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias test_colors="~/.zfuncs/read_colors"
alias neofetch="neofetch --cpu_speed off --cpu_brand off --gpu_brand off --block_range 0 15 --block_width 4 --shell_path on --shell_version off"
alias dia="dia --integrated"
alias tardiff="git status && git status --porcelain=v1 | awk '{print \$2}' | tar -cvf output.tar -T -"

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

#zsh functions
fpath=(
    ~/.zfuncs
    ~/.zfuncs/**/*~*/(CVS)#(/N)
    "${fpath[@]}"
)

# Virtual Enviroments
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export WORKON_HOME=~/.virtualenvs
if [[ $DISTRO =~ "^Arch" ]]; then
    if [ -e /usr/bin/virtualenvwrapper.sh ]; then
        source /usr/bin/virtualenvwrapper.sh;
    fi
else
    if [ -e /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
        source /usr/share/virtualenvwrapper/virtualenvwrapper.sh;
    fi
fi

