-- /lua/plugins/theme.lua
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		no_underline = false,
		styles = {
			comments = { "italic" },
			conditionals = { "italic", "bold" },
			loops = { "bold" },
			functions = { "bold" },
			keywords = { "italic", "bold" },
			strings = {},
			variables = {},
			numbers = {},
			booleans = { "bold" },
			properties = {},
			types = { "italic" },
			operators = {},
		},
		color_overrides = {},
		custom_highlights = function(colors)
			return {
				-- Make functions and keywords pop more
				Function = { fg = colors.blue, style = { "bold" } },
				Keyword = { fg = colors.mauve, style = { "bold", "italic" } },
				Constant = { fg = colors.peach, style = { "bold" } },
				Type = { fg = colors.yellow, style = { "italic" } },
				Operator = { fg = colors.sky },

				-- Better visual feedback
				Search = { bg = colors.peach, fg = colors.base },
				IncSearch = { bg = colors.red, fg = colors.base },
			}
		end,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = false,
			neotree = true,
			treesitter = true,
			telescope = {
				enabled = true,
			},
			mason = true,
			which_key = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd([[colorscheme catppuccin]])
	end,
}
