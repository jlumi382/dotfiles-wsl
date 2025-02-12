#!/usr/bin/env bash

# Get the latest release tag
LATEST_TAG=$(git ls-remote --tags --refs --sort=-v:refname https://github.com/neovim/neovim.git | head -n 1 | awk -F/ '{print $NF}')

# Clone the latest release branch
git clone -b "$LATEST_TAG" https://github.com/neovim/neovim.git "$HOME/repos/neovim"

# Install dependencies
sudo apt install cmake gettext lua5.1 liblua5.1-0-dev

# Build and install Neovim
cd "$HOME/repos/neovim" || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
