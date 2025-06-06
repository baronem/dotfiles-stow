local builtin = function()
	return require("telescope.builtin")
end

vim.keymap.set("n", "<leader>ff", builtin().find_files, {})
vim.keymap.set("n", "<leader>fg", builtin().live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin().buffers, {})
vim.keymap.set("n", "<leader>fh", builtin().help_tags, {})
vim.keymap.set("n", "<leader>ls", builtin().buffers, {})
vim.keymap.set("n", "<leader>bf", builtin().current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>km", builtin().keymaps, {})
