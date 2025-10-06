return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle", -- Optional, for lazy loading

	event = { "InsertLeave", "TextChanged" }, -- Optional, for lazy loading
	opts = {
		enabled = true,
		trigger_events = {
			immediate_save = { "BufLeave", "FocusLost" },
			deferred_save = { "InsertLeave", "TextChanged" },
		},
		condition = function(buf)
			local buftype = vim.fn.getbufvar(buf, "&buftype")
			if buftype == "nofile" or buftype == "prompt" or buftype == "terminal" then
				return false
			end
			return true
		end,
	},
}
