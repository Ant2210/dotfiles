return {
  "gutsavgupta/nvim-gemini-companion",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("gemini").setup()
  end,
  keys = {
    { "<leader>gat", "<cmd>GeminiToggle<cr>", desc = "Gemini: Toggle sidebar" },
    { "<leader>gas", "<cmd>GeminiSwitchToCli<cr>", desc = "Gemini: Switch to session" },
    {
      "<leader>gaa",
      function()
        vim.cmd("normal! gv")
        vim.cmd("'<,'>GeminiSend")
      end,
      mode = { "x" },
      desc = "Gemini: Send selection to AI",
    },
  },
}
