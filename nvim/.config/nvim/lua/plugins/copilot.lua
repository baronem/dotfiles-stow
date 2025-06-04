return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "BufReadPost",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = false,
			keymap = {},
		},
		panel = { enabled = false },
		filetypes = {
			markdown = true,
			help = true,
		},
	},
}
