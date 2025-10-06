-- /lua/plugins/telescope.lua
return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word under cursor" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" })
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search Neovim config" })
	end,
}
