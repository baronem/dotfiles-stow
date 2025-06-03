local config_dir = vim.fn.stdpath("config") .. "/lua/remaps"
local files = vim.fn.globpath(config_dir, "**/*.lua", true, true)

for _, file in ipairs(files) do
	-- Skip this file (init.lua)
	if not file:match("init%.lua$") then
		local module = file
			:gsub(vim.fn.stdpath("config") .. "/lua/", "") -- remove config path
			:gsub("%.lua$", "") -- strip extension
			:gsub("/", ".") -- convert to require path

		require(module)
	end
end
