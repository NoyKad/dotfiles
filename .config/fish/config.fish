set -x VIM $HOME/vim/src/vim
set -x VIMRUNTIME $HOME/vim/runtime
set -x PATH $VIM $PATH

alias vim=$HOME/vim/src/vim
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
fish_config prompt choose arrow
