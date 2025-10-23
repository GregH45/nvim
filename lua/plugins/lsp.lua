-- /lua/plugins/lsp.lua
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
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local kubernetes = require("kubernetes")

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
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

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

		-- YAML + Kubernetes + Kustomize
		local yamlls_schema = kubernetes.yamlls_schema()
		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					validate = true,
					format = { enable = true },
					hover = true,
					completion = true,
					keyOrdering = false,
					schemaStore = { enable = false },
					schemas = {
						[yamlls_schema] = { "*.yaml", "*.yml" },
						["https://json.schemastore.org/kustomization.json"] = {
							"kustomization.yaml",
							"kustomization.yml",
						},
					},
					customTags = {
						"!Ref scalar",
						"!Sub scalar",
						"!GetAtt scalar",
						"!GetAtt sequence",
						"!ImportValue scalar",
						"!Join sequence",
						"!Split sequence",
						"!Select sequence",
					},
				},
			},
		})
		vim.lsp.enable("yamlls")
	end,
}
