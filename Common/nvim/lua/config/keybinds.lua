-- Variable
local map = vim.keymap.set
local opts = { silent = true }
--[["TELESCOPE" IS A GLOBAL FROM lua/plugins/telescope.lua]]

-- Keybinds
vim.g.mapleader = ' '


map('n', '<leader>nh', '<cmd>nohl<CR>', opts) -- Remove Highlighting
map('n', '<C-s>', '<cmd>w<CR>', opts) -- Write file

-- Buffer control
map('n', '<leader>a', '<cmd>bprev<CR>', opts)
map('n', '<leader>d', '<cmd>bnext<CR>', opts)
map('n', '<leader>s', '<cmd>b#<CR>', opts)
map('n', '<leader>w', '<cmd>bdelete<CR>', opts)

map('n', '<C-^>', '<Nop>') -- Disable <cmd>b# default remap

-- Telescope
map('n', '<leader>ff', function()
	telescope.find_files()
end)

map('n', '<leader>fc', function()
	telescope.find_files{cwd = vim.fn.stdpath("config")}
end)

map ('n', '<leader>fg', function()
	telescope.live_grep()
end)

map ('n', '<leader>fd', function()
	require("telescope").extensions.file_browser.file_browser()
end)

map ('n', '<leader>fb', function()
	telescope.buffers()
end)
