-- /lua/plugins/telescope.lua
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		-- Setup telescope with better defaults
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/", "%.lock" },
				layout_strategy = "horizontal",
				layout_config = {
					preview_width = 0.6,
					horizontal = {
						size = {
							width = "95%",
							height = "95%",
						},
					},
				},
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		-- Load fzf extension if available
		pcall(telescope.load_extension, "fzf")

		-- File/buffer pickers
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume last search" })

		-- Search pickers
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word under cursor" })
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" })

		-- Help/documentation
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
		vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Search man pages" })

		-- Diagnostics
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })

		-- Git pickers
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
		vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Git buffer commits" })
		vim.keymap.set("n", "<leader>gf", builtin.git_status, { desc = "Git status" })
		vim.keymap.set("n", "<leader>gB", builtin.git_branches, { desc = "Git branches" })

		-- Config search
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search Neovim config" })
	end,
}
