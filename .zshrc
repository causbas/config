# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rgrep='rgrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -z $VISUAL ]; then
    export VISUAL=/usr/bin/nvim
fi
if [ "$IN_NEOVIM" = "true" ]; then
    source ~/.nvr_aliases
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list '' '' '' ''
zstyle ':completion:*' max-errors 2 numeric
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
#compinit # run from zplug

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# share history between terminals
setopt inc_append_history
setopt share_history
setopt hist_ignore_space

# gnome-keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle &&  zle -R
}

zle -N zle-keymap-select
zle -N edit-command-line
bindkey -v
bindkey '^F' autosuggest-accept
bindkey '^[f' forward-word
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^[p' history-substring-search-up
bindkey '^[n' history-substring-search-down
export KEYTIMEOUT=1

# zplug
source ~/.zplug/init.zsh
zplug "bhilburn/powerlevel9k", as:theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

bindkey -r '^G'
zplug "junegunn/8b572b8d4b5eddd8b85e5f4d40f17236", \
    from:gist, \
    as:plugin, \
    use:"{functions.sh,key-binding.zsh}"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='bold'

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# bar
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_HOME_ICON=""
POWERLEVEL9K_HOME_SUB_ICON=""
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="yellow"

POWERLEVEL9K_DIR_HOME_BACKGROUND='243'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='243'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='243'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'

# vcs
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='255'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='255'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='255'

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='075'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='233'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='221'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='233'
POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='N'
