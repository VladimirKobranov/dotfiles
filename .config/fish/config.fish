if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# run nvim with vim
alias vim='nvim'

# add z to fish
zoxide init fish | source

# Added by Windsurf
fish_add_path /Users/vladkobranov/.codeium/windsurf/bin

# air for go lang

set -x PATH $PATH $HOME/go/bin

# Added by Antigravity
fish_add_path /Users/vladkobranov/.antigravity/antigravity/bin
