vim.g.mapleader = " "

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/sainnhe/gruvbox-material"},
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/saghen/blink.cmp",                       version = '1.*' },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{
		src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
		version = vim.version.range('3')
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require 'configs.options'
require 'configs.comands'
require 'configs.keymap'
require 'plugins.blink'
require 'plugins.telescope'
require 'plugins.neo-tree'
require 'plugins.lsp'

