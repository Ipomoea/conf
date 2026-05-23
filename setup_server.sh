#!/bin/bash

set -euo pipefail

CONF_REPO="https://raw.githubusercontent.com/Ipomoea/conf/main"

echo "==> Updating apt and installing prerequisites"
sudo apt-get update
sudo apt-get install -y zsh git curl vim kitty-terminfo fzf

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "==> Installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "==> Installing vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "==> Fetching zsh and vim configs from Ipomoea/conf"
backup_and_fetch() {
    local target="$1"
    local url="$2"
    if [ -f "$target" ] && [ ! -L "$target" ]; then
        cp "$target" "$target.bak.$(date +%Y%m%d%H%M%S)"
    fi
    curl -fsSL "$url" -o "$target"
}

backup_and_fetch "$HOME/.zshrc"    "$CONF_REPO/.zshrc"
backup_and_fetch "$HOME/.vimrc"    "$CONF_REPO/.vimrc"
backup_and_fetch "$HOME/.p10k.zsh" "$CONF_REPO/.p10k.zsh"

echo "==> Installing vim plugins"
vim +PlugInstall +qall || echo "    (PlugInstall reported a non-zero exit; check manually with :PlugInstall)"

echo "Setup completed."
