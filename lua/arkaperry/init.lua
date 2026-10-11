-- Optional setup API for arkaperry.nvim.
local M = {}

function M.setup(opts)
	opts = opts or {}

	if opts.statusline then
		local ok, lualine = pcall(require, "lualine")
		if not ok then
			vim.notify("arkaperry statusline requires nvim-lualine/lualine.nvim", vim.log.levels.WARN)
			return
		end

		lualine.setup(require("arkaperry.statusline"))
	end
end

return M
