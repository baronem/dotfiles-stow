local copilot = function()
	return require("copilot.suggestion")
end

-- Accept: Word
vim.keymap.set("i", "<C-w>", copilot().accept_word)

-- Accept: Line
vim.keymap.set("i", "<C-l>", copilot().accept_line)

-- Accept: All
vim.keymap.set("i", "<C-a>", copilot().accept)

-- Suggestion: Next
vim.keymap.set("i", "<C-n>", copilot().next)

-- Suggestion: Prev
vim.keymap.set("i", "<C-p>", copilot().prev)

-- Suggestion: Dismiss
vim.keymap.set("i", "<C-e>", copilot().dismiss)
