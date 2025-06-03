-- Goto declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

-- Goto definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- Documentation preview (hover)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Diagnostics window
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
