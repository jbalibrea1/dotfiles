-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Personal keymaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open explorer file' })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste deleted text before current selection in visual mode' })

-- next greatest remap ever : asbjornHaland
-- can delete and paste without save the delete
-- copyio con ledader + y
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy selected part to clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copy entire line to clipboad' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d"]], { desc = 'Delete selected text without affecting registers' })

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set('n', '<leader>x', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })
--format
-- vim.keymap.set('n', '<leader>fa', vim.lsp.buf.format, { desc = 'Format document' })
-- vim.keymap.set('n', '<leader>f', function()
--   require('conform').format()
-- end, { desc = 'Format document' })

-- fast save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- MOVE BETWEEN BUFFERS
-- Switch between the current buffer and the last buffer
vim.api.nvim_set_keymap('n', '<leader>bb', '<C-^>', { noremap = true, silent = true, desc = 'Switch between the current buffer and the last buffer' })

-- Go to the nexvvt buffer
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true, desc = 'Go to the next buffer' })
-- vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true, desc = 'Go to the next buffer' })

-- Go to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true, desc = 'Go to the previous buffer' })
-- vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true, desc = 'Go to the previous buffer' })

-- Close the current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true, desc = 'Close the current buffer' })

-- Close all buffers without save
vim.api.nvim_set_keymap('n', '<leader>bk', ':bd!<CR>', { noremap = true, silent = true, desc = 'Close all buffers without save' })

-- Buffer list
vim.api.nvim_set_keymap('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true, desc = 'Buffer list' })

-- List buffers and select one
vim.api.nvim_set_keymap('n', '<leader>bg', ':ls<CR>:buffer<Space>', { noremap = true, silent = true, desc = 'List buffers and select one' })

-- Divide the window horizontally with a new buffer
vim.api.nvim_set_keymap('n', '<leader>bh', ':new<CR>', { noremap = true, silent = true, desc = 'Divide the window horizontally with a new buffer' })

-- Divide the window vertically with a new buffer
vim.api.nvim_set_keymap('n', '<leader>bv', ':vnew<CR>', { noremap = true, silent = true, desc = 'Divide the window vertically with a new buffer' })
