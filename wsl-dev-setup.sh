#!/usr/bin/env bash
set -e

echo "======================================="
echo "  WSL DEVELOPMENT ENVIRONMENT SETUP"
echo "======================================="

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing required packages ==="
sudo apt install -y \
  git \
  curl \
  wget \
  unzip \
  tmux \
  ripgrep \
  fd-find \
  build-essential \
  xclip

########################################
# STARSHIP
########################################
echo "=== Installing Starship ==="

if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
else
  echo "✓ Starship already installed."
fi

echo "=== Copying starship.toml ==="
mkdir -p ~/.config
cp ./bashrc/starship.toml ~/.config/starship.toml

########################################
# BASHRC
########################################
echo "=== Installing .bashrc ==="
cp ./bashrc/.bashrc ~/.bashrc

########################################
# TMUX
########################################
echo "=== Installing tmux configuration ==="
cp ./tmux/.tmux.conf ~/.tmux.conf

########################################
# NEOVIM >= 0.11.2
########################################
echo "=== Installing Neovim ==="

REQUIRED_NVIM="0.11.2"
INSTALL_NVIM=false

if command -v nvim >/dev/null 2>&1; then
  INSTALLED_NVIM=$(nvim --version | head -n1 | awk '{print $2}')

  # Compare versions (simple check: if installed != required)
  if [ "$INSTALLED_NVIM" != "$REQUIRED_NVIM" ]; then
    echo "Neovim version $INSTALLED_NVIM found — upgrading to $REQUIRED_NVIM..."
    INSTALL_NVIM=true
  else
    echo "✓ Neovim $REQUIRED_NVIM already installed."
  fi
else
  echo "Neovim not found — installing $REQUIRED_NVIM..."
  INSTALL_NVIM=true
fi

if [ "$INSTALL_NVIM" = true ]; then
  NVIM_VERSION="v${REQUIRED_NVIM}"
  wget https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz
  tar xzf nvim-linux-x86_64.tar.gz
  sudo rm -rf /usr/local/neovim
  sudo mv nvim-linux-x86_64 /usr/local/neovim
  sudo ln -sf /usr/local/neovim/bin/nvim /usr/local/bin/nvim
  rm nvim-linux-x86_64.tar.gz
fi

########################################
# NEOVIM CONFIG
########################################
echo "=== Copying Neovim configuration ==="
rm -rf ~/.config/nvim
mkdir -p ~/.config
cp -r ./nvim ~/.config/nvim

echo "=== DONE! ==="
echo "Restart your WSL terminal to load everything."
