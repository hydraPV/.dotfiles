local function last_dirs(n)
	local cwd = vim.fn.getcwd()
	local sep = package.config:sub(1, 1)
	local parts = vim.split(cwd, sep, { trimempty = true })

	local start = math.max(1, #parts - (n - 1))
	return sep .. table.concat(parts, sep, start, #parts)
end

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function()
		require('lualine').setup {
			options = {
				theme = 'gruvbox_dark',
			},

			sections = {
				lualine_a = {
					function()
						local mode_icons = {
							n = "",
							i = "",
							v = "",
							V = "󰩫",
							c = "󰬲",
						}
						return mode_icons[vim.fn.mode()] or ""
					end
				},
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 
					function()
						return last_dirs(3)
					end,
				},
				lualine_x = { 'filename', 'filesize', 'filetype' },
			},
		}
	end
}
