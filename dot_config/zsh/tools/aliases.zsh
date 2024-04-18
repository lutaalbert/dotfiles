# ls and tree
alias ls='lsd -lA --group-dirs=first'
alias tree='lsd --tree -A --group-dirs=last'

# nvim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# system
alias shutdown='sudo shutdown -h now'
alias restart='sudo shutdown -r now'
alias reboot='sudo shutdown -r now'
alias sleep='sudo shutdown -s now'

# cp, mv and rm
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# clipboard
alias cbcopy='pbcopy'
alias cbpaste='pbpaste'

# cat
alias cat='bat'

# colorize --help commands
alias -g -- --help='--help 2>&1 | bat --language=help --plain'

# python
alias pip='pip3'

# htop
alias htop='sudo htop'

