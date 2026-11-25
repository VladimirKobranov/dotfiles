# Powerlevel10k instant prompt must be loaded before anything that may print output.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zoxide zsh-syntax-highlighting)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  print -u2 "Oh My Zsh not found at $ZSH; skipping its configuration."
fi

# Keep the prompt config alongside this Stow package.
_dotfiles_zsh_dir="${${(%):-%x}:A:h}"
[[ -r "$_dotfiles_zsh_dir/.p10k.zsh" ]] && source "$_dotfiles_zsh_dir/.p10k.zsh"
unset _dotfiles_zsh_dir

alias vim='nvim'
(( $+commands[eza] )) && alias ls='eza'

# Keep PATH unique even when login and interactive startup both run.
typeset -U path PATH
export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)

(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

export PNPM_HOME="$HOME/Library/pnpm"
[[ -d "$PNPM_HOME" ]] && path=("$PNPM_HOME" $path)
[[ -d "$HOME/.opencode/bin" ]] && path=("$HOME/.opencode/bin" $path)
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && path=("$HOME/.antigravity/antigravity/bin" $path)
[[ -d "$HOME/.lmstudio/bin" ]] && path=("$HOME/.lmstudio/bin" $path)

# Load nvm only when a Node command is first used.
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  [[ -d "$NVM_DIR" && -s /opt/homebrew/opt/nvm/nvm.sh ]] && source /opt/homebrew/opt/nvm/nvm.sh
}
node() { _load_nvm; command node "$@" }
npm()  { _load_nvm; command npm "$@" }
npx()  { _load_nvm; command npx "$@" }
nvm()  {
  [[ -s /opt/homebrew/opt/nvm/nvm.sh ]] || { print -u2 "nvm is not installed"; return 127; }
  mkdir -p "$NVM_DIR" || return
  unfunction nvm
  source /opt/homebrew/opt/nvm/nvm.sh
  nvm "$@"
}
