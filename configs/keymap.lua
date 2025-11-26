local fns = require 'plugins.utils'
local km = vim.keymap.set
local telescope_builtin = require('telescope.builtin')

km("n", "<leader>pc", fns.pack_clean)
km('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format" })
km('n', "<leader>o", ":update<CR> :source<CR>", { desc = "Source file" })
km('n', "<leader>w", ":write<CR>", { desc = "Save" })
km({ 'n', 'x', 'v' }, "<leader>y", '"+y', { desc = "Yank" })
km('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
km('n', '<leader> ', telescope_builtin.find_files, { desc = 'Telescope find files' })
km('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
km('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
km('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })
km("n", "n", "nzzzv", { desc = "Next search result (centered)" })
km("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
