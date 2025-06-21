vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.api.nvim_set_keymap('n', '<Leader>d', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>pf', ':FzfLua files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':FzfLua git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':FzfLua grep<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "gt", ":bnext<CR>")
vim.keymap.set("n", "gT", ":bprevious<CR>")
vim.keymap.set("n", "gQ", ":bdelete<CR>")
