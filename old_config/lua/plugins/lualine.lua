return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox',
        icons_enabled = true,
        globalstatus = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section = 'top',
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'filename',
            path = 1, -- 1 = relative path, 2 = full path
          },
        },
        lualine_x = { 'encoding', { 'diff', colored = true, symbols = { added = '+', modified = '~', removed = '-' } }, 'filetype' },
        lualine_y = { 'branch' },
        lualine_z = { 'location' },
      },
      inactive_winbar = {
        lualine_c = {
          {
            'filename',
            path = 1,
            color = { fg = '#555555' },
          },
        },
      },
      disabled_filetypes = {
        statusline = { 'neo-tree', 'NeoTree' },
        winbar = { 'neo-tree', 'NeoTree' },
        inactive_winbar = { 'neo-tree', 'NeoTree' },
      },
    }
  end,
}