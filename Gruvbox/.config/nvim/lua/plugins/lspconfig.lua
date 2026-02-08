return {
	'neovim/nvim-lspconfig',

	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("clangd")
	end,
}
