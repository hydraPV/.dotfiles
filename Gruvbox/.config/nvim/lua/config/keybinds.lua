-- Variable
local map = vim.keymap.set
--[["TELESCOPE" IS A GLOBAL FROM lua/plugins/telescope.lua]]

-- Keybinds
vim.g.mapleader = ' '


map('n', '<leader>nh', ':nohl<CR>') -- Remove Highlighting
map('n', '<C-s>', ':w<CR>') -- Write file

-- Telescope
map('n', '<leader>ff', function() 
	telescope.find_files()
end)

map('n', '<leader>fc', function()
	telescope.find_files{cwd = vim.fn.stdpath("config")}
end)

map ('n', '<leader>fb', function()
	telescope.buffers()
end)
