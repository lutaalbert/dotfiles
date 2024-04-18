# add env vars, auto load .nvmrc when switching directories, enable corepack when installing new node versions
eval "$(fnm env --use-on-cd --corepack-enabled)"

# add completions
source $HOME/.config/zsh/tools/fnm/_fnm
