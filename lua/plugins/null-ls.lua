return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'jay-babu/mason-null-ls.nvim' },
  opts = function()
    local null_ls = require 'null-ls'
    return {
      sources = {
        null_ls.builtins.diagnostics.shellcheck,
      },
    }
  end,
}
