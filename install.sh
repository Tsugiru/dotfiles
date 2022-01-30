#!/bin/bash

# check the OS
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt -y install git
    platform='linux' 
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='mac' 
fi

# install alacritty
if [ $platform == "linux" ]; then
    sudo apt update
    sudo apt -y install curl
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
    sudo apt -y install build-essential cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    cargo install alacritty
elif [ $platform == "mac" ]; then
    brew install --cask alacritty
fi
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
cd ..
rm -rf alacritty

# install fish
if [ $platform == "linux" ]; then
    sudo apt -y install software-properties-common
    sudo add-apt-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt -y install fish
elif [ $platform == "mac" ]; then
    brew install fish
fi

# install tmux
if [ $platform == "linux" ]; then
    sudo apt -y install autoconf automake pkg-config
    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    ./configure && make
    cd ..
    rm -rf tmux/
elif [ $platform == "mac" ]; then
    brew install tmux
fi

# run fish installation script
fish install.fish

