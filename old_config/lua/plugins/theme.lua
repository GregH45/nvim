local theme = {
	"morhetz/gruvbox",
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd("colorscheme gruvbox")
		-- Gruvbox-specific config (dark background, for example)
		vim.o.background = "dark"
	end,
}

return theme
