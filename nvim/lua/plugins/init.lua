local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
end

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Package manager

  use "tpope/vim-fugitive"

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.config.treesitter").setup()
    end,
    run = function()
      require("plugins.config.treesitter").update()
    end,
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" }
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.config.lsp")
    end,
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.config.cmp")
    end,
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    }
  }

  use "hrsh7th/cmp-nvim-lsp"

  use "hrsh7th/cmp-buffer"

  use "hrsh7th/cmp-path"

  use "hrsh7th/cmp-cmdline"

  use "folke/tokyonight.nvim"

  use { "junegunn/fzf", run = ":call fzf#install()" }

  use "junegunn/fzf.vim"

  use {
    "RRethy/vim-illuminate",
    config = function()
      require("plugins.config.illuminate")
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.config.lualine")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.config.autopairs")
    end,
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.config.comment")
    end,
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" }
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.config.gitsigns")
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("plugins.config.indent_blankline")
    end
  }

  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("plugins.config.nvimtree")
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
