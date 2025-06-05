return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup{
      direction = "float",
      open_mapping = [[<leader>t]],
    }  
  end
}
