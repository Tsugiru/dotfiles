return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim", "love" },
        disable = { "lowercase-global" }
      },
      completion = {
        callSnippet = "Both"
      }
    }
  }
}
