if [ -z $VISUAL ]; then
    export VISUAL=/usr/bin/nvim
fi
# if in neovim open files in current instance
if [ "$IN_NEOVIM" = "true" ] && hash nvr;then
    export VISUAL="nvr -cc split --remote-wait"
    alias nvim=nvr
    function nvsplit() { nvr -c "split $@" }
    function nvvsplit() { nvr -c "vsplit $@" }
    function nvcwdsync() { nvr -c "cd $(pwd)"; }
    # sync buffer-local working directory with shell
    function chpwd() { nvr -c "lcd $(pwd)"; }
fi

source ~/.bash_aliases

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

bindkey -v
bindkey '^F' autosuggest-accept
bindkey '^[f' forward-word
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^[p' history-substring-search-up
bindkey '^[n' history-substring-search-down

# zplug
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

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
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='bold'
