-- /lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			prettier_lf = {
				command = "prettier",
				args = { "--end-of-line", "lf" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			bash = { "beautysh" },
			yaml = { "prettier_lf" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}

