local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.load_extension("ui-select")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

return telescope.setup({
	defaults = {
		sorting_strategy = 'ascending',
		layout_config = {
			prompt_position = "top",
		}
	},

})
