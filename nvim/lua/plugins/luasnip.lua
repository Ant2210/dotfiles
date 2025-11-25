return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")

      ls.setup({})

      -- Load friendly snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load your package.json-style snippet collection
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = vim.fn.stdpath("config") .. "/snippets",
      })
    end,
  },
}
