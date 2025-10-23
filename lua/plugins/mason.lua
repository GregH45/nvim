-- /lua/plugins/mason.lua
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ensure_installed = { "stylua", "isort", "black", "beautysh", "prettier" },
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"pylsp",
				"yamlls",
			},
		})
	end,
}
