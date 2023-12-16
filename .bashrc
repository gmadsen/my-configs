#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

source /usr/share/nvm/init-nvm.sh
eval "$(zoxide init bash)
eval "$(starship init bash)
source /home/madsen/.config/broot/launcher/bash/br
