-- /lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			prettier_lf = {
				command = "prettier",
				args = { "--end-of-line", "lf" },
			},
			hadolint = { command = "hadolint" },
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			bash = { "beautysh" },
			yaml = { "prettier_lf" },
			docker = { "hadolint" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}

