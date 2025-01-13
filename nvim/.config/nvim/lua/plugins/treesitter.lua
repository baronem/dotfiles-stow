return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
            highlight = { enable = true },
            indent = { enable = true },
			ensure_installed = {
				-- vim
				"vimdoc",

				--languages
				"lua",
				"sql",
				"css",
				"go",
				"gomod",
				"javascript",
				"typescript",

				--  data / markup
				"toml",
				"yaml",
				"xml",
				"html",
				"json",

				-- misc
				"dockerfile",
				"regex",
			},
			auto_install = true,
		})
	end,
}
