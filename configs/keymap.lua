local fns = require 'plugins.utils'
local km = vim.keymap.set

vim.keymap.set("n", "<leader>pc", fns.pack_clean)
km('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format" })
km('n', "<leader>o", ":update<CR> :source<CR>", { desc = "Source file" })
km('n', "<leader>w", ":write<CR>", { desc = "Save" })
km({ 'n', 'x', 'v' }, "<leader>y", '"+y', { desc = "Yank" })
