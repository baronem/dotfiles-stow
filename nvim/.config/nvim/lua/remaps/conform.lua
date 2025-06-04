local custom_format = function(opts)
	opts = opts or {}
	opts.bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
	require("conform").format(opts)
end

vim.keymap.set("n", "<leader>cf", function()
	custom_format({ timeout_ms = 1000 })
end)
