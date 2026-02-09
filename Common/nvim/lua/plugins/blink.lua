return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = 'default' },
		appearance = { nerd_font_variant = 'mono' },
		completion = { documentation = { auto_show = false } },
		sources = {
			default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
				lazydev = {
					name = "Lazydev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				}
			}
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
