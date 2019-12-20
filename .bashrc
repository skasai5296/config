set -o vi

bind 'set enable-bracketed-paste off'

export PATH=.:~/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby.2.6.0/bin:$PATH

#initialize conda
. $HOME/anaconda3/etc/profile.d/conda.sh
export PATH=$HOME/anaconda3/bin:$PATH
conda activate base
