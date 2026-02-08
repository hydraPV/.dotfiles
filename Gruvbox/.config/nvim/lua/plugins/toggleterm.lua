return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup ({
			direction = "float",
			float_opts = {
				border = "single",
			},
			open_mapping = [[<C-t>]],
		})
	end
}
