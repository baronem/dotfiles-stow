return {
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"j-hui/fidget.nvim",
		},
		init = function()
			require("plugins.code-companion-ext.noice-status").init()
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			preview = {
				filetypes = { "codecompanion" },
				ignore_buftypes = {},
				icon_provider = "internal",
			},
		},
	},
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				source = diff.gen_source.none(),
			})
		end,
	},
}
