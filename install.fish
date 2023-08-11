set fish_shell_path (which fish)

# set default shell to fish
echo $fish_shell_path | sudo tee -a /etc/shells
sudo chsh -s $fish_shell_path

# install fisher, the fish package manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install neovim
switch (uname)
  case Linux
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    git clone https://github.com/neovim/neovim
    cd neovim
    rm -r build/  # clear the CMake cache
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
    make install
    fish_add_path ~/neovim/bin
    cd ..
    rm -rf neovim
  case Darwin
    brew install neovim
end

# set neovim as default editor
set -U -x EDITOR nvim
set -U -x VISUAL nvim

# install osc52 escape sequence script
sudo cp yank /bin
sudo chmod 777 /bin/yank

# install rg
switch (uname)
  case Linux
    sudo apt -y install ripgrep
  case Darwin
    brew install ripgrep
end

# install fzf
switch (uname)
  case Linux
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
    fish_add_path ~/.cargo/bin/
    cargo install fd-find
    cargo install --locked bat
  case Darwin
    brew install fzf
    brew install fd
    brew install bat
end
fisher install PatrickF1/fzf.fish

# set FZF_DEFAULT_COMMAND and show hidden files on ctrl + alt + f
set -U -x FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"
set -U -x fzf_fd_opts --hidden --exclude=.git --color=never

# install z directory jumping tool
fisher install jethrokuan/z

# install FiraCode Nerd Font
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh FiraCode
cd ..
rm -rf nerd-fonts

# below, remove symlinks if they are already present

# install fortune
switch (uname)
  case Linux
    sudo apt -y install fortune
    rm ~/.local/bin/fortune
    ln -s /usr/games/fortune ~/.local/bin
  case Darwin
    brew install fortune
end

# symlink kitty config
switch (uname)
  case Linux
    rm ~/.config/kitty/kitty.conf
    ln -s (pwd)/kitty/kitty_linux.conf ~/.config/kitty/kitty.conf
  case Darwin
    rm ~/.config/kitty/kitty.conf
    ln -s (pwd)/kitty/kitty_macos.conf ~/.config/kitty/kitty.conf
end
ln -s (pwd)/kitty/themes ~/.config/kitty/themes

# symlink nvim config files
rm -rf ~/.config/nvim
ln -s (pwd)/nvim ~/.config/nvim

# symlink fish config files
set -U fish_function_path ~/.config/fish/functions/user_functions $fish_function_path

rm -rf ~/.config/fish/colors
ln -s (pwd)/fish/colors ~/.config/fish

rm -rf ~/.config/fish/functions/user_functions
ln -s (pwd)/fish/user_functions ~/.config/fish/functions

# symlink tmux config file
rm ~/.tmux.conf
ln -s (pwd)/.tmux.conf ~/.tmux.conf

# set the fish color scheme to follow terminal colors
setscheme
# set bat program color theme
set -Ux BAT_THEME base16
# set colorscheme (default dark) for applications
lord dark
