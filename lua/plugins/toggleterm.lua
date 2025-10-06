-- /lua/plugins/toggleterm.lua
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
		close_on_exit = true,
		on_open = function(term)
			vim.keymap.set("t", "<Esc><Esc>", function()
				vim.cmd("ToggleTerm direction=float")
			end, { buffer = term.bufnr })
		end,
	},
}
