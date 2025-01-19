# .Dotfiles

## Requirements

- Brew
- Stow
- iTerm2
- Neovim
- NerdFonts (any)
- Lazyvim
- Fish | Fisher | Tide6
- MC
- Btop

## Content

### MacOS:
##### Brew.sh
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
##### Stow
```bash
brew install stow
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
##### Btop
```bash
brew install btop
```



### Extra: Tofu60 keyboard layout

## Install

```bash
git clone https://github.com/VladimirKobranov/dotfiles.git ~/.dotfiles/
cd ~/.dotfiles
brew stow .
```
