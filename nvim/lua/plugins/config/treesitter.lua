return {
  setup = function()
    local status, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not status then
      return
    end

    treesitter.setup({
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        'c',
        'cpp',
        'go',
        'lua',
        'python',
        'fish',
        'javascript',
        'typescript',
        "vimdoc",
        "luadoc",
        "vim",
        "lua",
        "markdown"
      },

      autopairs = {
        enable = true,
      },

      highlight = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-x>',
        },
      },
    })

    require('ts_context_commentstring').setup {
      enable_autocmd = false,
      languages = {
        typescript = '// %s',
      },
    }
  end,

  update = function()
    local status, ts_update = pcall(require, 'nvim-treesitter.install')
    if not status then
      return
    end
    ts_update.update({ with_sync = true })()
  end
}
