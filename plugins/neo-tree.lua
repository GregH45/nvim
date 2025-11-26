local nt = require('neo-tree')
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

---@module 'neo-tree'
---@type neotree.Config
local config = {
	close_if_last_window = true,
	source_selector = {
		truncation_character = "|",
		winbar = false,
		statusline = true,
	}
}
return nt.setup(config)
