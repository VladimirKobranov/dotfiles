# instant prompt (keep)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

# keep only one theme - p10k (faster with instant prompt)
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zoxide
)

source $ZSH/oh-my-zsh.sh
. "$HOME/.cargo/env"

# p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
alias vim='nvim' #vim is vi
alias ls='eza' # better ls


# removed fzf duplicates (kept only via system, no manual source)

# bun (kept, no extras)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# removed bun completion (slow)
# [ -s "/home/vk/.bun/_bun" ] && source "/home/vk/.bun/_bun"

# zoxide
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/vk/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# opencode
export PATH=/home/vk/.opencode/bin:$PATH

# removed nvm from autoload (main slowdown)
# using lazy load instead:
lazy_nvm() {
  unset -f nvm node npm npx
  export NVM_DIR="$HOME/.nvm"
  . "/opt/homebrew/opt/nvm/nvm.sh"
}

alias node='lazy_nvm; node'
alias npm='lazy_nvm; npm'
alias npx='lazy_nvm; npx'
alias nvm='lazy_nvm; nvm'

# extra PATH
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/vlad/.antigravity/antigravity/bin:$PATH"

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/vlad/.lmstudio/bin"
# End of LM Studio CLI section
