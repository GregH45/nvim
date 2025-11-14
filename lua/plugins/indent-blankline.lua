return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
