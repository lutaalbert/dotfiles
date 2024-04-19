# credit: ssh-agent plugin from ohmyzsh - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/ssh-agent/ssh-agent.plugin.zsh

function _start_agent() {
  # Get the filename to store/lookup the environment from
  local ssh_env_cache
  ssh_env_cache="$HOME/.ssh/environment"

  # Check if ssh-agent is already running
  if [[ -f "$ssh_env_cache" ]]; then
    . "$ssh_env_cache" > /dev/null

    # Test if $SSH_AUTH_SOCK is visible
    zmodload zsh/net/socket
    if [[ -S "$SSH_AUTH_SOCK" ]] && zsocket "$SSH_AUTH_SOCK" 2>/dev/null; then
      return 0
    fi
  fi

  # Create the ssh dir if not present
  local ssh_dir
  ssh_dir="$HOME/.ssh"
  if [[ ! -d "$ssh_dir" ]]; then
    mkdir -p "$ssh_dir"
    chmod 700 "$ssh_dir"
  fi

  # Start ssh-agent and setup environment
  ssh-agent -s | sed '/^echo/d' >! "$ssh_env_cache"
  chmod 600 "$ssh_env_cache"
  . "$ssh_env_cache" > /dev/null
}

_start_agent
