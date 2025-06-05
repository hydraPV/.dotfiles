return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {'nvim-lua/plenary.nvim',{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}},
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      extensions = {
        media_files = {
          filetypes = {"png", "webp", "jpg", "jpeg"},
          find_cmd = "rg"
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true
        }
      }
    })
    telescope.load_extension('fzf')
  end
}
