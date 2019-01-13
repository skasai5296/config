
# aliases

# ls with color
case "$OSTYPE" in
    darwin*)
        export LSCOLORS=gxfxcxdxbxegedabagacad
        ;;
    linux*)
        LS_COLORS=$LS_COLORS:'di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
        export LS_COLORS
        # enable color support of ls and also add handy aliases
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
            #alias dir='dir --color=auto'
            #alias vdir='vdir --color=auto'

            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
        fi
        ;;
esac
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
alias exA='gcc A.cpp&&./a.out'
alias exB='gcc B.cpp&&./a.out'
alias exC='gcc C.cpp&&./a.out'
alias exD='gcc D.cpp&&./a.out'

# prompt settings
PS1='\[\e[38;5;45m\][\u@\h \W] \[\e[38;5;196m\]\[\e[0m\] '
PS2='> '

bind 'set enable-bracketed-paste off'

case "$OSTYPE" in
    darwin*)
        if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
        fi
        ;;
    linux*)
        if [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi
        ;;
esac



bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
