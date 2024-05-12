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
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Personal keymaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
-- can delete and paste without save the delete
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set('n', '<leader>x', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- fast save
-- vim.keymap.set('n', '<leader>w', ':w')
vim.keymap.set('n', '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save file' })
-- buffers

-- Alternar entre el buffer actual y el último buffer
vim.api.nvim_set_keymap('n', '<leader>bb', '<C-^>', { noremap = true, silent = true })

-- Ir al siguiente buffer
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true })

-- Ir al buffer anterior
vim.api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true })

-- Cerrar el buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- Eliminar el buffer
vim.api.nvim_set_keymap('n', '<leader>bk', ':bd!<CR>', { noremap = true, silent = true })

-- Listar buffers
vim.api.nvim_set_keymap('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true })

-- Listar y seleccionar buffer
vim.api.nvim_set_keymap('n', '<leader>bg', ':ls<CR>:buffer<Space>', { noremap = true, silent = true })

-- División horizontal con nuevo buffer
vim.api.nvim_set_keymap('n', '<leader>bh', ':new<CR>', { noremap = true, silent = true })

-- División vertical con nuevo buffer
vim.api.nvim_set_keymap('n', '<leader>bv', ':vnew<CR>', { noremap = true, silent = true })
