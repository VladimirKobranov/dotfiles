# Homebrew sets up its standard paths before other tools are initialized.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -r "$HOME/.vite-plus/env" ]] && source "$HOME/.vite-plus/env"
