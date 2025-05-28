local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua',
  'shfmt',
  'shellcheck',
  'dockerls',
  'docker_compose_language_service',
  'hadolint',
  'terraform-ls',
  'pylsp',
})
return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  opts = {
    ensure_installed = ensure_installed,
  },
}
