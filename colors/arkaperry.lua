-- arkaperry.nvim
-- Pure black background with vivid syntax highlighting.

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "arkaperry"

local colors = {
  bg      = "#000000",
  fg      = "#F4F4F5",
  comment = "#777783",
  cyan    = "#45D6FF",
  green   = "#6EFF8A",
  purple  = "#C792EA",
  orange  = "#FFAD66",
  pink    = "#FF79C6",
  yellow  = "#F1FA8C",
  blue    = "#82AAFF",
  red     = "#FF5C70",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function fg(color, extra)
  return vim.tbl_extend("force", { fg = color }, extra or {})
end

-- Base editor and subtle separators
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalNC", { fg = colors.fg, bg = colors.bg })
hi("SignColumn", { bg = colors.bg })
hi("EndOfBuffer", fg(colors.bg))
hi("LineNr", fg(colors.comment))
hi("CursorLineNr", fg(colors.cyan, { bold = true }))
hi("CursorLine", { bg = "#101014" })
hi("Visual", { bg = "#29253A" })
hi("Search", { fg = colors.bg, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.orange })
hi("WinSeparator", { fg = "#252530", bg = colors.bg })
hi("VertSplit", { fg = "#252530", bg = colors.bg })

-- Traditional Vim syntax groups
hi("Comment", fg(colors.comment, { italic = true }))
hi("String", fg(colors.green))
hi("Character", fg(colors.green))
hi("Constant", fg(colors.orange))
hi("Number", fg(colors.orange))
hi("Boolean", fg(colors.orange, { bold = true }))
hi("Float", fg(colors.orange))
hi("Identifier", fg(colors.fg))
hi("Function", fg(colors.cyan, { bold = true }))
hi("Statement", fg(colors.purple))
hi("Conditional", fg(colors.purple, { bold = true }))
hi("Repeat", fg(colors.purple, { bold = true }))
hi("Keyword", fg(colors.purple, { bold = true }))
hi("Operator", fg(colors.pink))
hi("Type", fg(colors.yellow))
hi("Structure", fg(colors.yellow))
hi("Typedef", fg(colors.yellow))
hi("StorageClass", fg(colors.purple))
hi("PreProc", fg(colors.pink))
hi("Include", fg(colors.pink))
hi("Macro", fg(colors.pink))
hi("Special", fg(colors.cyan))
hi("SpecialChar", fg(colors.orange))
hi("Delimiter", fg(colors.fg))
hi("Tag", fg(colors.pink))
hi("Error", fg(colors.red, { bold = true }))
hi("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })

-- Tree-sitter captures
local captures = {
  ["@comment"] = fg(colors.comment, { italic = true }),
  ["@string"] = fg(colors.green),
  ["@string.escape"] = fg(colors.orange, { bold = true }),
  ["@character"] = fg(colors.green),
  ["@number"] = fg(colors.orange),
  ["@boolean"] = fg(colors.orange, { bold = true }),
  ["@constant"] = fg(colors.orange),
  ["@constant.builtin"] = fg(colors.orange, { italic = true }),
  ["@function"] = fg(colors.cyan, { bold = true }),
  ["@function.call"] = fg(colors.cyan),
  ["@function.method"] = fg(colors.cyan, { bold = true }),
  ["@constructor"] = fg(colors.yellow, { bold = true }),
  ["@variable"] = fg(colors.fg),
  ["@variable.builtin"] = fg(colors.red, { italic = true }),
  ["@variable.parameter"] = fg(colors.fg),
  ["@variable.member"] = fg(colors.blue),
  ["@property"] = fg(colors.blue),
  ["@field"] = fg(colors.blue),
  ["@type"] = fg(colors.yellow),
  ["@type.builtin"] = fg(colors.yellow, { italic = true }),
  ["@type.definition"] = fg(colors.yellow, { bold = true }),
  ["@keyword"] = fg(colors.purple, { bold = true }),
  ["@keyword.return"] = fg(colors.purple, { bold = true }),
  ["@keyword.function"] = fg(colors.purple, { bold = true }),
  ["@keyword.operator"] = fg(colors.pink),
  ["@conditional"] = fg(colors.purple, { bold = true }),
  ["@repeat"] = fg(colors.purple, { bold = true }),
  ["@operator"] = fg(colors.pink),
  ["@punctuation"] = fg(colors.fg),
  ["@punctuation.delimiter"] = fg(colors.comment),
  ["@tag"] = fg(colors.pink),
  ["@tag.attribute"] = fg(colors.blue),
  ["@markup.heading"] = fg(colors.cyan, { bold = true }),
  ["@markup.link"] = fg(colors.cyan, { underline = true }),
  ["@markup.raw"] = fg(colors.green),
  ["@diff.plus"] = fg(colors.green),
  ["@diff.minus"] = fg(colors.red),
}

for group, opts in pairs(captures) do
  hi(group, opts)
end
