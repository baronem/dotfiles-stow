-- Actions Menu
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<CR>")

-- Toggle Chat
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>")

-- Inline Prompt
vim.keymap.set({ "n", "v" }, "<leader>ai", ":CodeCompanion ")

-- Add Selected Code to Chat
vim.keymap.set("v", "gp", "<cmd>CodeCompanionChat Add<CR>")

-- Expand cc for commands
vim.cmd([[cab cc CodeCompanion]])
