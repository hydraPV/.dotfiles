-- keybinds
require('config.keybinds')

-- Variable
local opt = vim.opt

-- options
opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.fillchars = {eob = ' '}
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes:1"

-- Treesitter Highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'lua', 'bash', 'python', 'c++' },
  callback = function() vim.treesitter.start() end,
})

require('config.lazy')
