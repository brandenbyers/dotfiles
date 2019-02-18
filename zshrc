# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# load our own completion functions
#fpath=(~/.zsh/completion $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

# Use exit or logout instead of ctrl-d
setopt ignoreeof

# load custom executable functions
# for function in ~/.zsh/functions/*; do
#  source $function
# done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# 10ms for key sequences
KEYTIMEOUT=1

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# switch back to vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# search
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# load dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export PATH=$PATH:$HOME/bin

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Cabal Haskell
# export PATH="$HOME/Library/Haskell/bin:$PATH"

# Python
# export PATH="/usr/local/share/python:$PATH"

export NVM_DIR="/Users/branden/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm use default

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Swift 2.2
#export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Things 3 CLI
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
  #. $(brew --prefix)/etc/bash_completion
#fi

# OTTO
#export CC=clang
#export CXX=clang++
#export CXXFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/include"
#export LDFLAGS="-L/usr/local/lib $(brew info llvm | grep LDFLAGS= | cut -d = -f 2 | tr '"' ' ')"

# Tmuxinator
source ~/bin/tmuxinator.zsh

# Pyenv Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Todo.txt
#source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion complete -F _todo t
#alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/Dropbox/Notes/todo/todo.cfg'

# Fastlane
#export PATH="$HOME/.fastlane/bin:$PATH"

BASHPROFILE="$HOME/.bash_profile"
if [[ -n $BASHPROFILE ]]; then
  source $BASHPROFILE
fi

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Genesys
source ~/setgenenv.sh

# Antigen
#source /usr/local/share/antigen/antigen.zsh

# Analytics UI
export QUEUES_ENGINE_DEV_MODE
QUEUES_ENGINE_DEV_MODE=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Android Emulator
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH

# Maven (for android)
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
export M2=${M2_HOME}/bin
export PATH=${PATH}:${M2_HOME}/bin

# Flutter
export PATH=$PATH:/Users/branden/Projects/flutter/bin

# completion
autoload -U compinit
compinit

