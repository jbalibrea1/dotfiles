-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set

-- Diagnostic keymaps
-- local diagnostic_goto = function(count)
--   return function()
--     vim.diagnostic.jump { count = count, float = true }
--   end
-- end
-- default for nvim
-- map('n', '[d', diagnostic_goto(-1), { desc = 'Go to previous [D]iagnostic message' })
-- map('n', ']d', diagnostic_goto(1), { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- clear hl on pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Fast save
map('n', '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Personal keymaps
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- better up/down movement
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- Greatest remap ever
map('x', '<leader>p', [["_dP]], { desc = 'Paste deleted text before current selection in visual mode' })
-- Next greatest remap ever : asbjornHaland
-- Can delete and paste without save the delete
-- map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy selected part to clipboard' })
-- map('n', '<leader>Y', [["+Y]], { desc = 'Copy entire line to clipboad' })
-- map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete selected text without affecting registers' })

-- This is going to get me cancelled
map('i', '<C-c>', '<Esc>')
map('i', 'jj', '<Esc>')

map('n', '<leader>cx', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- windows
map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })

-- Buffers
map('n', '<leader>bb', '<C-^>', { desc = 'Switch between the current buffer and the last buffer' })
map('n', '<leader>bn', ':bn<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', ':bp<CR>', { desc = 'Prev buffer' })
map('n', ']b', ':bn<CR>', { desc = 'Next buffer' })
map('n', '[b', ':bp<CR>', { desc = 'Prev buffer' })
map('n', '<leader>bd', ':bd<CR>', { desc = 'Close the current buffer' })
map('n', '<leader>bk', ':bd!<CR>', { desc = 'Close all buffers without save' })
map('n', '<leader>bl', ':ls<CR>', { desc = 'Buffer list' })
map('n', '<leader>bg', ':ls<CR>:buffer<Space>', { desc = 'List buffers and select one' })
map('n', '<leader>bh', ':new<CR>', { desc = 'Divide the window horizontally with a new buffer' })
map('n', '<leader>bv', ':vnew<CR>', { desc = 'Divide the window vertically with a new buffer' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Buffer Delete and Window' })
-- stylua: ignore start
  -- map('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Buffer Delete' })
  map('n', '<leader>bo', function() Snacks.bufdelete.other() end, { desc = 'Delete [O]thers Buffer' })
-- stylua: ignore end

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- git
-- stylua: ignore start
map('n', '<leader>gb', function() Snacks.picker.git_log_line() end, { desc = 'Git Blame Line' })
map({ 'n', 'x' }, '<leader>gB', function() Snacks.gitbrowse() end, { desc = 'Git Browse (open)' })
map({ 'n', 'x' }, '<leader>gY', function() end, { desc = 'Git Browse (copy)' })
-- stylua: ignore end
