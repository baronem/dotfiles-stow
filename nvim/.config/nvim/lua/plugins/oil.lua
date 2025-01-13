return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{
			"<leader>fv",
			vim.cmd.Oil,
			desc = "Open Oil.nvim file view",
		},
	},
}
