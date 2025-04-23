return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    require('mason-null-ls').setup {
      ensure_installed = {
        'shfmt',
        'shellcheck',
      },
      automatic_installation = true,
    }

    null_ls.setup {
      debug = true, -- enable for troubleshooting
      sources = {
        -- Shell
        null_ls.builtins.formatting.shfmt,

        -- YAML / JSON
      },
    }
  end,
}
