HISTFILE=~/.zsh_history # don't use the .config directory to save history
HISTSIZE=1000000 # increase the history size
SAVEHIST=$HISTSIZE*1.2

setopt EXTENDED_HISTORY # write the history file in the ':start:elapsed;command' format
setopt SHARE_HISTORY # share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS # do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS # delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS # do not display a previously found event
setopt HIST_IGNORE_SPACE # do not record an event starting with a space
setopt HIST_REDUCE_BLANKS # remove superfluous blanks before recording entry
setopt HIST_VERIFY # do not execute immediately upon history expansion

# CTRL+p (↑ arrow-up) - go up the history chain
bindkey '^P' history-search-backward
# CTRL+n (↓ arrow-down) - go down the history chain
bindkey '^N' history-search-forward

