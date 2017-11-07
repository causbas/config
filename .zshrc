if [ -z $VISUAL ]; then
    export VISUAL=/usr/bin/nvim
fi
# if in neovim open files in current instance
if [ "$IN_NEOVIM" = "true" ] && hash nvr;then
    export VISUAL="nvr -cc split --remote-wait"
    function nvim-in-nvim-terminal-wrapper() { nvr --remote-wait "$@" &; }
    alias nvim=nvim-in-nvim-terminal-wrapper
fi

source ~/.bash_aliases

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list '' '' '' ''
zstyle ':completion:*' max-errors 2 numeric
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
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

# antigen
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundle z
source ~/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/z/z.sh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle andrewferrier/fzf-z
antigen apply

bindkey -v
bindkey '^F' autosuggest-accept
bindkey '^[f' forward-word
bindkey '^P' up-line-or-history  
bindkey '^N' down-line-or-history
bindkey '^G' fzfz-file-widget
bindkey '^[p' history-substring-search-up
bindkey '^[n' history-substring-search-down
