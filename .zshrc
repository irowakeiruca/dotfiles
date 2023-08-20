export LC_CTYPE=ja_JP.UTF-8
export EDITOR=nvim
autoload -Uz compinit && compinit

PROMPT='%n@%m:%~ %# '
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=20

# alias
alias v='nvim'

setopt auto_cd
setopt no_beep
setopt nolistbeep
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob

bindkey -v
bindkey "^[[3~" delete-char
bindkey -M viins 'jj' vi-cmd-mode

#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*:default' menu select=1

eval "$(starship init zsh)"
