-- /lua/plugins/gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local map = function(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "Git: " .. desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next hunk")
			map("n", "[h", gs.prev_hunk, "Previous hunk")

			-- Actions
			map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>gb", gs.blame_line, "Blame line")
			map("n", "<leader>gB", function()
				gs.blame_line({ full = true })
			end, "Blame line (full)")
			map("n", "<leader>gd", gs.diffthis, "Diff this")
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, "Diff this ~")

			-- Stage/reset hunks
			map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			-- Stage/reset buffer
			map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

			-- Undo stage
			map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")

			-- Toggle
			map("n", "<leader>gtb", gs.toggle_current_line_blame, "Toggle line blame")
			map("n", "<leader>gtd", gs.toggle_deleted, "Toggle deleted")
		end,
	},
}
