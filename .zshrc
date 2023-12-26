# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export LC_TYPE=ja_JP.UTF-8
export EDITOR=nvim
PROMPT='%n@%m:%~ %# '
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=20
ZVM_VI_ESCAPE_BINDKEY=jj

# alias
alias v='nvim'
alias ls='lsd -F'
alias cat='bat --theme TwoDark'
alias grep='grep --color'
alias du='dust'

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
setopt print_eight_bit

#bindkey -v
bindkey "^[[3~" delete-char
#bindkey -M viins 'jj' vi-cmd-mode

#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*:default' menu select=1

eval "$(sheldon source)"
