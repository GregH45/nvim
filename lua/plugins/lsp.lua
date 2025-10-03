-- /lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
				end

				map("gd", vim.lsp.buf.definition, "Goto Definition")
				map("K", vim.lsp.buf.hover, "Hover")

				local builtin = require("telescope.builtin")
				map("grd", builtin.lsp_definitions, "Goto Definition (Telescope)")
				map("grr", builtin.lsp_references, "Goto References (Telescope)")
				map("gri", builtin.lsp_implementations, "Goto Implementation (Telescope)")
				map("gO", builtin.lsp_document_symbols, "Document Symbols (Telescope)")
				map("gW", builtin.lsp_dynamic_workspace_symbols, "Workspace Symbols (Telescope)")

				map("grn", vim.lsp.buf.rename, "Rename")
				map("gra", vim.lsp.buf.code_action, "Code Action")
			end

			-- Global LSP settings
			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Diagnostic config
			vim.diagnostic.config({
				virtual_text = true,
			})

			-- Bash
			vim.lsp.config("bashls", {})
			vim.lsp.enable("bashls")

			-- Python
			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							jedi = {
								environment = vim.fn.getcwd() .. "/venv",
							},
						},
					},
				},
			})
			vim.lsp.enable("pylsp")

			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")
		end,
	},
}
