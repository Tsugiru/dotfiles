local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  use 'tpope/vim-fugitive' -- Git commands in nvim

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.config.treesitter').setup()
    end,
    run = function()
      require('plugins.config.treesitter').update()
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.lspconfig').setup()
    end,
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip'
    },
  }

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-path'

  use 'hrsh7th/cmp-cmdline'

  use 'saadparwaiz1/cmp_luasnip'

  use 'folke/tokyonight.nvim'

  use { "junegunn/fzf", run = ":call fzf#install()" }

  use { 'junegunn/fzf.vim' }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.config.lualine')
    end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
