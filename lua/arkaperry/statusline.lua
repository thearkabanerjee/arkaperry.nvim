-- Lualine configuration for the optional ArkaPerry statusline.
-- Load with: require("lualine").setup(require("arkaperry.statusline"))

local black = "#000000"
local blue = "#45D6FF"
local green = "#6EFF8A"
local purple = "#C792EA"
local orange = "#FFAD66"
local pink = "#FF79C6"
local muted = "#777783"
local white = "#F4F4F5"
local peach = "#c2255c"

local mode_colors = {
	n = blue,
	i = peach,
	ic = peach,
	v = purple,
	V = purple,
	["\22"] = purple,
	c = orange,
	R = pink,
	t = green,
}

local function mode_label()
	local mode = vim.api.nvim_get_mode().mode
	local labels = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		R = "REPLACE",
		t = "TERMINAL",
	}
	return labels[mode] or "NORMAL"
end

local function mode_section()
	return {
		mode_label,
		color = function()
			local mode = vim.api.nvim_get_mode().mode
			return {
				fg = black,
				bg = mode_colors[mode] or blue,
				gui = "bold",
			}
		end,
		separator = { left = "", right = "" },
		padding = { left = 1, right = 1 },
	}
end

return {
	options = {
		theme = {
			normal = {
				a = { fg = black, bg = blue, gui = "bold" },
				b = { fg = blue, bg = black },
				c = { fg = muted, bg = black },
			},
			insert = {
				a = { fg = black, bg = green, gui = "bold" },
				b = { fg = green, bg = black },
				c = { fg = muted, bg = black },
			},
			visual = {
				a = { fg = black, bg = purple, gui = "bold" },
				b = { fg = purple, bg = black },
				c = { fg = muted, bg = black },
			},
			replace = {
				a = { fg = black, bg = pink, gui = "bold" },
				b = { fg = pink, bg = black },
				c = { fg = muted, bg = black },
			},
			command = {
				a = { fg = black, bg = orange, gui = "bold" },
				b = { fg = orange, bg = black },
				c = { fg = muted, bg = black },
			},
			inactive = {
				a = { fg = muted, bg = black },
				b = { fg = muted, bg = black },
				c = { fg = muted, bg = black },
			},
		},
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		globalstatus = true,
	},

	sections = {
		lualine_a = { mode_section() },
		lualine_b = {
			{
				"branch",
				icon = "",
				color = { fg = blue, bg = black },
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = {
					modified = " ●",
					readonly = " ",
					unnamed = "☰",
				},
				color = { fg = white, bg = black },
			},
		},
		lualine_x = {
			{
				"filetype",
				icon_only = true,
				color = { fg = blue, bg = black },
			},
		},
		lualine_y = {
			{ "progress", color = { fg = blue, bg = black } },
			{ "location", color = { fg = blue, bg = black } },
		},
		lualine_z = {
			{
				function()
					return "◷ " .. os.date("%H:%M")
				end,
				color = { fg = black, bg = blue, gui = "bold" },
				padding = { left = 1, right = 1 },
			},
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				color = { fg = muted, bg = black },
			},
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	extensions = {},
}
