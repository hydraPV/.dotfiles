return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
                lua = { "stylua" },
				bash = { "beautysh" },
				sh = { "beautysh" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				jsonc = { "prettier" },
				json = { "prettier" },
			},
		})
	end,
}
