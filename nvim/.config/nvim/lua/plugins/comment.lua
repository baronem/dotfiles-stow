return {
	"terrortylor/nvim-comment",
	lazy = false,
	opts = {
		marker_padding = true,
		-- should comment out empty or whitespace only lines
		comment_empty = false,
		-- trim empty comment whitespace
		comment_empty_trim_whitespace = true,
		-- Should key mappings be created
		create_mappings = true,
		-- Normal mode mapping left hand side
		line_mapping = "gcc",
		-- Visual/Operator mapping left hand side
		operator_mapping = "gc",
		-- text object mapping, comment chunk,,
		comment_chunk_text_object = "ic",
		-- Hook function to call before commenting takes place
		hook = nil,
	},
    config = function(_, opts)
        require("nvim_comment").setup(opts)
    end,
}
