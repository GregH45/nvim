-- /lua/plugins/lint.lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			bash = { "shellcheck" },
			dockerfile = { "hadolint" },
			-- yaml = { "yamllint" },  -- Disabled: yamlls LSP provides enough validation
		}

		-- Create autocmd to trigger linting
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- Only lint if the linter is available
				pcall(lint.try_lint)
			end,
		})
	end,
}
