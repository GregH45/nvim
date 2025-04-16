return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' },
      }
    end,
  },
  --'jay-babu/mason-null-ls.nvim',
  --'jose-elias-alvarez/null-ls.nvim',
}
