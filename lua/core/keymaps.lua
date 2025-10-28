-- /lua/core/keymaps.lua

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Toggle terminal
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- LSP
vim.keymap.set("n", "<leader>lf", "<cmd>Format<CR>", { desc = "Format code" })
vim.keymap.set("n", "<leader>la", "<cmd>Lint<CR>", { desc = "Lint code" })
vim.keymap.set("n", "<leader>lr", "vim.lsp.buf.rename()", { desc = "Rename" })
vim.keymap.set("n", "<leader>ld", "vim.lsp.buf.definition()", { desc = "Definition" })
vim.keymap.set("n", "<leader>lh", "vim.lsp.buf.hover()", { desc = "Hover" })


