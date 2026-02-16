return {
	'nvim-telescope/telescope.nvim',
	version = '*',

	dependencies = {
		'nvim-lua/plenary.nvim',
		-- Native fzf on telescope
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		-- File browser for telescope
		{
			'nvim-telescope/telescope-file-browser.nvim',
			require("telescope").setup {
				extensions = {
					depth = 2,
					hidden = { file_browser = false, folder_browser = false },
				}
			},
		},
	},

	config = function()
		telescope = require('telescope.builtin') -- Global variable to use in keybinds.lua
		require('telescope').setup {
			pickers = {
				find_files = {
					hidden = true
				},
				live_grep = {
					hidden = true
				}
			},
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					horizontal = {
						preview_width = 0.6,
					},
				}
			},

			extensions = { fzf = {} },
			require('telescope').load_extension('fzf'),
			require("telescope").load_extension "file_browser"
		}
	end
}
