#!/bin/bash

# check the OS
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt -y install git
    platform='linux' 
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='mac' 
fi

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

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

