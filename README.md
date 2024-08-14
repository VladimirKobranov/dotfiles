# .Dotfiles

## Requirements

- Brew
- iTerm2 (macos)
- Neovim
- NerdFonts (any)
- Lazyvim
- Fish | Fisher | Tide6
- MC

## Content

### MacOS:
##### Brew.sh
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
##### iTerm 2
```bash
brew install --cask iterm2
```
##### Nvim | Lazyvim
```bash
brew install --cask font-jetbrains-mono-nerd-font
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```
##### Fish | Fisher | Tide6
```bash
brew install fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
brew install fisher
fisher install IlanCosman/tide@v6
tide configure
```
##### MC
```bash
brew install mc
```

### Ubuntu:
##### Nvim | Lazyvim
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```
##### Fish | Fisher | Tide6

```bash
sudo apt install build-essential cmake libpcre2-dev gettext
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v6
tide configure
```

### Extra: Tofu60 keyboard layout

## Install

```bash
git clone https://github.com/VladimirKobranov/dotfiles.git ~/.dotfiles/
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```
