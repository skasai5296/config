
# aliases

# ls with color
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

# Always list directory contents upon 'cd'
cd() { builtin cd "$@"; ll; }
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias chrome='open -a google\ chrome'

alias bp='vim ~/.bash_profile'
alias br='vim ~/.bashrc'
alias sbp='source ~/.bash_profile'
alias sbr='source ~/.bashrc'

alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim'

alias atgp='~/Documents/atcoder/autogit.sh'

# prompt settings
PS1='\[\e[38;5;45m\][\u@\h \W] \[\e[38;5;196m\]\[\e[0m\] '
PS2='> '
export LSCOLORS=gxfxcxdxbxegedabagacad

bind 'set enable-bracketed-paste off'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
