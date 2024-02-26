local config = {
	template = "> *Snippet from* `{filepath}` *at* `L{line}`:\n```{filetype}\n{code}```",
	register = "+",
}

local join = function(list)
	local joined = ""
	for _, line in ipairs(list) do
		joined = joined .. line .. "\n"
	end
	return joined
end

local M = {}
function M.setup(user_provided_config)
	if user_provided_config then
		config = vim.tbl_deep_extend("force", config, user_provided_config)
	end

	vim.api.nvim_create_user_command("CopyAsMarkdown", function(table)
		local md = config.template
			:gsub("{filepath}", vim.fn.expand("%"))
			:gsub("{line}", table.line1)
			:gsub("{filetype}", vim.bo.filetype)
			:gsub("{code}", join(vim.api.nvim_buf_get_lines(0, table.line1 - 1, table.line2, true)))
		vim.fn.setreg(config.register, md)
	end, { range = true })
end

return M
