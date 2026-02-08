return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		telescope = require('telescope.builtin') -- Global variable to use in keybinds.lua

		require('telescope').setup {
			extensions = {
				fzf = {}
			},
			require('telescope').load_extension('fzf')
		}
	end
}
