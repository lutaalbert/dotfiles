# Add fzf to the path
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# rebind ALT-C to CTRL-Z
bindkey -rM emacs '\ec'
bindkey -rM vicmd '\ec'
bindkey -rM viins '\ec'

zle     -N              fzf-cd-widget
bindkey -M emacs '\C-z' fzf-cd-widget
bindkey -M vicmd '\C-z' fzf-cd-widget
bindkey -M viins '\C-z' fzf-cd-widget

# use fd instead of the default find command for listing path candidates
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git"'

# CTRL-T - search file
# use fd instead of the default find command for listing path candidates
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# add file preview using bat
# add CTRL-/ binding to toggle small preview window to see the full command
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-R - search history
# add CTRL-/ binding to toggle small preview window to see the full command
# add CTRL-Y binding to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# ALT-C - cd into directory
# use fd to generate the list for directory completion
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
# add tree structure preview
export FZF_ALT_C_OPTS="--preview 'lsd --tree -A --group-dirs=last --color=always {}'"

# use fd instead of the default find command for listing path candidates
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
