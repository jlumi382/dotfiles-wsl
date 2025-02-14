# Windows Dotfiles with WSL

## Install Visual Studio

```bat
winget install --id=Microsoft.VisualStudio.2022.Community -e
```

## Install Unity Hub

```bat
winget install --id=Unity.UnityHub -e
```

## Install JetBrainsMono Nerd Font

1. Go to `JetBrainsMonoNerdFont` folder.
2. Select all `.ttf` files.
3. Right click and select install.

## Setup Windows Terminal Config

1. Copy `settings.json` in `Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState`.
2. Press `WIN + R` and enter this:

```txt
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
```

3. Paste the `settings.json` file in this directory.

## Enable WSL Feature

```bat
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

## Enable VM Feature

```bat
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

## Set Default WSL Version to 2

```bat
wsl --set-default-version 2
```

## Install WSL Ubuntu Distro

```bat
wsl --install -d Ubuntu
```

## Set Default WSL Distro to Ubuntu

```bat
wsl --set-default Ubuntu
```

## Update WSL

```bat
wsl --update
```

## Create User in Ubuntu Terminal

```sh
useradd --create-home --shell /usr/bin/bash --user-group --groups  adm,dialout,cdrom,floppy,sudo,audio,dip,video,plugdev,netdev --password $(read -sp Password: pw ; echo $pw | openssl passwd -1 -stdin) lumi
```

## Set Default User to lumi

```bat
ubuntu config --default-user lumi
```

## Install Neovim

```sh
cd "$HOME/dotfiles"
./install_nvim.sh
```

## Install Yazi

```sh
sudo apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
git clone https://github.com/sxyazi/yazi.git "$HOME/repos/sxyazi/yazi"
cd "$HOME/repos/sxyazi/yazi"
cargo build --release --locked
ya pack -a DreamMaoMao/clipboard
```

## Install Zotero

```sh
wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
sudo apt update
sudo apt install zotero
```

## Install My Core Packages

```sh
sudo apt update
sudo apt install git stow eza bat pass build-essential manpages-dev valgrind gdb python3 python3-pip python3-venv nodejs npm php php-xml composer sqlite3 texlive-full tree-sitter-cli zathura
sudo apt purge vim
sudo apt autoremove
```
