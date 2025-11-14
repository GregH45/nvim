return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  branch = "regexp",
  cmd = "VenvSelect",
  opts = {
    name = {
      "venv",
      ".venv",
      "env",
      ".env",
    },
    auto_refresh = true,
  },
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
  },
}
