
# added by Anahonda3 5.1.0 installer
export PATH="/Users/seito/anaconda3/bin:$PATH"

## Set path for pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export PATH="~/Documents/nlp_100/mongodb/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# .bashrcの実行（存在する場合）
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
