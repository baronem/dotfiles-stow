return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = false,
			staticcheck = true,
			gofumpt = true,
			completeFunctionCalls = false,
		},
	},
}
