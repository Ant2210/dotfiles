# Development Environment Setup Checklist

_For Windows + WSL Ubuntu_

This file contains the full setup process for both the **Windows host environment** and the **WSL Ubuntu environment**, ensuring your development setup is reproducible and consistent.

---

# 🟦 Windows Setup Checklist

## 1. Install Kitty (Windows Terminal Emulator)

Download:  
https://sw.kovidgoyal.net/kitty/

## 2. Install CaskaydiaCove Nerd Font

Download from Nerd Fonts:  
https://www.nerdfonts.com/font-downloads

Install all `.ttf` files (right-click → Install for all users).

## 3. Add Kitty Config

Place your config file here:

%USERPROFILE%.config\kitty\kitty.conf

Create directories if they don’t exist.

## 4. (Optional) Set Kitty as Default Terminal

Windows Terminal → Settings → Default Profile → Select **Kitty**.

## 5. (Optional) Install Starship for Windows PowerShell

winget install starship

Starship config (only if you want it in Windows):

%USERPROFILE%.config\starship.toml

## 6. (Optional) Install Git for Windows

https://git-scm.com/download/win

Useful if using GitHub Desktop or Windows-side tooling.

---

# 🟩 WSL Ubuntu Setup Checklist

## 1. Update Ubuntu

sudo apt update && sudo apt upgrade -y

## 2. Clone Your Dotfiles Repo

Place it anywhere, e.g.:

~/Code/dotfiles

Confirm the repo contains:

bashrc/.bashrc
bashrc/starship.toml
tmux/.tmux.conf
nvim/ (LazyVim config)

## 3. Run the Setup Script

Ensure the script is executable:

chmod +x wsl-dev-setup.sh
./wsl-dev-setup.sh

This script will:

- Install Starship
- Copy `.bashrc`
- Install tmux
- Install Neovim >= 0.11.2
- Copy your LazyVim Neovim config
- Install ripgrep, fd, xclip, and dependencies

## 4. Restart WSL

Close all terminal windows → reopen Ubuntu.

## 5. Verification

Check everything installed correctly:

### Neovim

nvim --version

Should show:  
`NVIM v0.11.2`

### tmux

tmux -V

### Starship

starship module time

### Config directories

ls ~/.config

Should show at minimum:

- `nvim`
- `starship.toml`

---

# ✔ Completed Setup

Once both sections are finished, your environment will match your complete development setup with:

- Kitty (Windows)
- Nerd Fonts (Windows)
- Starship (WSL)
- Neovim + LazyVim (WSL)
- Bash customisations (WSL)
- tmux (WSL)

---

# Notes

- Kitty and Nerd Fonts run **entirely on Windows**, not inside WSL.
- `.bashrc`, `starship.toml`, and Neovim configs belong **inside WSL only**.
- Windows and WSL have separate configs for Starship (only use WSL one unless you want PowerShell support).

---

Happy hacking! 🚀
