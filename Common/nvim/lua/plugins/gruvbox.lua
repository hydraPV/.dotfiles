return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = true,
	config = function()
		require("gruvbox").setup({
			palette_overrides = { bright_green = "#fbf1c7" },
			overrides = {
				SignColumn = {
					bg = "#32302f",
				}
			},
			contrast = "soft",
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
