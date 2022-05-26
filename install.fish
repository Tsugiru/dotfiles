set fish_shell_path (which fish)

# set default shell to fish
echo $fish_shell_path | sudo tee -a /etc/shells
chsh -s $fish_shell_path

# install fisher, the fish package manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install neovim and clangd
switch (uname)
  case Linux
    sudo apt -y install neovim
    sudo apt -y install clangd-12
  case Darwin
    brew install neovim
    brew install llvm
end

# set neovim as default editor
set -U -x EDITOR nvim
set -U -x VISUAL nvim

# install ag
switch (uname)
  case Linux
    sudo apt -y install silversearcher-ag
  case Darwin
    brew install the_silver_searcher
end

# install fzf
switch (uname)
  case Linux
    sudo apt -y install fzf
    sudo apt -y install fd-find
    sudo apt -y install bat
    mkdir -p ~/.local/bin
    ln -s $(which fdfind) ~/.local/bin/fd
    ln -s /usr/bin/batcat ~/.local/bin/bat
  case Darwin
    brew install fzf
    brew install fd
    brew install bat
end
fisher install PatrickF1/fzf.fish

# set FZF_DEFAULT_COMMAND and show hidden files on ctrl + alt + f
set -U -x FZF_DEFAULT_COMMAND "ag --hidden --ignore .git -f -g \"\""
set -U -x fzf_fd_opts --hidden --exclude=.git

# install z directory jumping tool
fisher install jethrokuan/z

# install FiraCode Nerd Font
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh FiraCode
cd ..
rm -rf nerd-fonts

# symlink kitty config
switch (uname)
  case Linux
    ln -s ~/dotfiles/kitty/kitty_linux.conf ~/.config/kitty/kitty.conf
  case Darwin
    ln -s ~/dotfiles/kitty/kitty_macos.conf ~/.config/kitty/kitty.conf
end

# symlink nvim config files
mkdir -p ~/.config/nvim/lua/plugins
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/lua/plugins/init.lua ~/.config/nvim/lua/plugins/init.lua
ln -s ~/dotfiles/nvim/lua/plugins/lspconfig.lua ~/.config/nvim/lua/plugins/lspconfig.lua
ln -s ~/dotfiles/nvim/lua/plugins/diffviewconfig.lua ~/.config/nvim/lua/plugins/diffviewconfig.lua

# symlink fish config files
set -U fish_function_path ~/.config/fish/functions/user_functions $fish_function_path
ln -s ~/dotfiles/fish/colors ~/.config/fish
ln -s ~/dotfiles/fish/user_functions ~/.config/fish/functions

# symlink tmux config file
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

