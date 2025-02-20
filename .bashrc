#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

eval "$(starship init bash)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cw='/home/vigz/.config/wal/change_wallpaper.sh'
alias rw='/home/vigz/.config/wal/random_wallpaper.sh'
alias n='nvim'
PS1='[\u@\h \W]\$ '

# Created by `pipx` on 2025-02-19 16:57:21
export PATH="$PATH:/home/vigz/.local/bin"
