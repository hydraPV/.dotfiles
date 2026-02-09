return {
	'rachartier/tiny-inline-diagnostic.nvim',
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "",
				right = "",
				diag = "●",
				arrow = "    ",
				up_arrow = "    ",
				vertical = " │",
				vertical_end = " └",
			},
			blend = {
				factor = 0.22,
			},
			options = {
				multilines = {
					enabled = true,
				}
			},
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "●",
						[vim.diagnostic.severity.WARN]  = "●",
						[vim.diagnostic.severity.INFO]  = "●",
						[vim.diagnostic.severity.HINT]  = "●",
					},
				},
				virtual_text = false
			})

		})
	end,
}
