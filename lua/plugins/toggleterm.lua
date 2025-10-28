-- /lua/plugins/toggleterm.lua
return {
	"Dan7h3x/neaterm.nvim",
	event = "VeryLazy",
	opts = {
		float_width = 0.8,
		float_height = 0.5,
		border = "rounded",
		use_default_keymaps = true,
		terminals = {
			main = {
				name = "MainShell",
				type = "float",
			},
		},
		keymaps = {
			toggle = "<leader>tt",
			new_float = "<leader>tf",
		},
	},
}
