return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true,
			transparent_mode = false,
			contrast = "soft",
			palette_overrides = { bright_green = "#fbf1c7" },
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
