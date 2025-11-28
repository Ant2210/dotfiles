-- This preset adds a rounded border to LSP hover docs and signature help
return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
  },
}
