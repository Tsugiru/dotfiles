# install fisher, the fish package manager
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# clone and install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fisher install PatrickF1/fzf.fish

# install tide command line prompt
fisher install IlanCosman/tide@v5
tide configure

# install z directory jumping tool
fisher install jethrokuan/z

# install FiraCode Nerd Font
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh FiraCode
cd ..

# symlink alacritty config
switch (uname)
  case Linux
    ln -s ~/dotfiles/alacritty/.alacritty_linux.yml ~/.alacritty.yml
  case Darwin
    ln -s ~/dotfiles/alacritty/.alacritty_macos.yml ~/.alacritty.yml
end

# symlink nvim config files
mkdir -p ~/.config/nvim/lua/plugins
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/lua/plugins/init.lua ~/.config/nvim/lua/plugins/init.lua
ln -s ~/dotfiles/nvim/lua/plugins/lspconfig.lua ~/.config/nvim/lua/plugins/lspconfig.lua

# symlink fish config files
set -U fish_function_path ~/.config/fish/functions/user_functions $fish_function_path
mkdir ~/.config/fish/functions/user_functions
ln -s ~/dotfiles/fish/colors ~/.config/fish/colors
ln -s ~/dotfiles/fish/user_functions ~/.config/fish/functions/user_functions

# symlink tmux config file
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

