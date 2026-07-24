echo 'star.zshrc'
prompt off
export FZF_DEFAULT_COMMAND="fd --type f"
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
export STARSHIP_CONFIG=$HOME/.config/starship.toml
mkdir -p /tmp/.starship_cache
export STARSHIP_CACHE=/tmp/.starship_cache
eval "$(starship init zsh)"
