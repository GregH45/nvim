-- /lua/plugins/lsp.lua
-- Main LSP configuration with shared settings
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/neodev.nvim", opts = {} },
		{
			"diogo464/kubernetes.nvim",
			opts = {
				schema_strict = true,
				schema_generate_always = true,
				patch = true,
				yamlls_root = function()
					return vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/yaml-language-server/")
				end,
			},
		},
	},
	config = function()
		-- Shared LSP capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- Add folding capabilities for nvim-ufo
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Shared on_attach function for all LSP servers
		local on_attach = function(client, bufnr)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
			end

			-- Basic LSP mappings
			map("K", vim.lsp.buf.hover, "Hover")
			map("grd", require("telescope.builtin").lsp_definitions, "Goto Definition")
			map("grr", require("telescope.builtin").lsp_references, "Goto References")
			map("gri", require("telescope.builtin").lsp_implementations, "Goto Implementation")
			map("gO", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
			map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
			map("grn", vim.lsp.buf.rename, "Rename")
			map("gra", vim.lsp.buf.code_action, "Code Action")

			-- Autoformat on save
			if client.name ~= "yamlls" and client.supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

		-- Global diagnostic configuration
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "●",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- ============================================================
		-- Language Server Configurations
		-- ============================================================

		-- Python
		vim.lsp.config("pylsp", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				pylsp = {
					plugins = {
						jedi = { environment = vim.fn.getcwd() .. "/venv" },
					},
				},
			},
		})
		vim.lsp.enable("pylsp")

		-- Bash
		vim.lsp.config("bashls", { capabilities = capabilities, on_attach = on_attach })
		vim.lsp.enable("bashls")

		-- Lua
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = { diagnostics = { globals = { "vim" } } },
			},
		})
		vim.lsp.enable("lua_ls")

		-- YAML + Kubernetes + Helm (complex config extracted to separate module)
		require("config.yaml-k8s")(capabilities, on_attach)

		-- Docker
		vim.lsp.config("dockerls", { capabilities = capabilities, on_attach = on_attach })
		vim.lsp.enable("dockerls")

		-- Markdown
		vim.lsp.config("marksman", { capabilities = capabilities, on_attach = on_attach })
		vim.lsp.enable("marksman")
	end,
}
