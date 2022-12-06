#!/bin/bash

# check the OS
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt -y install curl
    platform='linux' 
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='mac' 
fi

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
if [ $platform == "linux" ]; then
    mkdir -p ~/.local/bin
    # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
    # your system-wide PATH)
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty.desktop file(s)
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
fi

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
    sudo apt -y install libevent-dev ncurses-dev build-essential bison pkg-config
    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    ./configure && make && make install
    cd ..
    rm -rf tmux/
elif [ $platform == "mac" ]; then
    brew install tmux
fi

# run fish installation script
fish install.fish

