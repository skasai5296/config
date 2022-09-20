#!/usr/bin/env zsh

function peco-history-selection() {
    if [ -z ${BUFFER} ];
    then
        Result=`history -n 1 | tac | awk '!a[$0]++' | peco --prompt "searching command history >"`
    else
        Result=`history -n 1 | tac | awk '!a[$0]++' | peco --query ${BUFFER} --prompt "searching command history >"`
    fi
    Result=$(echo $Result | sed 's/\\n/\\'"$LINE_BREAK"'/g')
    if [ ! -z $Result ];
    then
        BUFFER=$Result
    fi
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
