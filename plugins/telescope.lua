local telescope = require("telescope")

telescope.load_extension("ui-select")


return telescope.setup({
	defaults = {
		sorting_strategy = 'ascending',
		layout_config = {
			prompt_position = "top",
		}
	},

})
