-- YAML + Kubernetes + Kustomize + Helm Configuration
return function(capabilities, on_attach)
	local kubernetes = require("kubernetes")
	local yamlls_schema = kubernetes.yamlls_schema()

	-- YAML + Kubernetes + Kustomize
	vim.lsp.config("yamlls", {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			yaml = {
				validate = true,
				format = { enable = false },
				hover = true,
				completion = true,
				keyOrdering = false,
				schemaStore = { enable = false },
				schemas = {
					[yamlls_schema] = {
						"*.k8s.yaml",
						"*.k8s.yml",
						"k8s/**/*.yaml",
						"k8s/**/*.yml",
						"*.yaml",
						"*.yml",
					},
					["https://json.schemastore.org/kustomization.json"] = {
						"kustomization.yaml",
						"kustomization.yml",
					},
					["https://raw.githubusercontent.com/fluxcd/flux2/main/manifests/schemas/all.json"] = {
						"**/flux-system/**/*.yaml",
						"**/flux-system/**/*.yml",
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

	-- Helm
	vim.lsp.config("helm_ls", {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			["helm-ls"] = {
				yamlls = {
					enabled = true,
					path = "yaml-language-server",
				},
			},
		},
	})
	vim.lsp.enable("helm_ls")
end
