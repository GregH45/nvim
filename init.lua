-- init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins.autosave" },
		{ import = "plugins.completion" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.indent-blankline" },
		{ import = "plugins.lsp" },
		{ import = "plugins.lualine" },
		{ import = "plugins.mason" },
		{ import = "plugins.neo-tree" },
		{ import = "plugins.telescope" },
		{ import = "plugins.theme" },
		{ import = "plugins.toggleterm" },
		{ import = "plugins.web-devicons" },
		{ import = "plugins.which-key" },
		{ import = "plugins.lint" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.comment" },
		{ import = "plugins.conform" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
})

-- Auto sync plugins on startup
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		require("lazy").sync({ show = false })
	end,
	desc = "Sync plugins on startup",
})

-- Load core configuration
require("core.options")
require("core.keymaps")
