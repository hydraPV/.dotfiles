return {
   "m4xshen/hardtime.nvim",
   lazy = false,
   dependencies = { "MunifTanjim/nui.nvim" },
   config = function()
	   require ("hardtime").setup({
			disable_mouse = false
	   })
   end
}
