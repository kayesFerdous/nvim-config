vim.g.colors_name = "default_theme"

local c = {
  bg = "#1a1b26",
  fg = "#e0e0e0",
  red = "#f5457c",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#58c8b1",
  cyan = "#7dcfff",
  blue = "#43aaf9",
  magenta = "#bb9af7",
  comment = "#565f89",
  dark_gray = "#1f2335",
  purple = "#ff75a0",
  aqua = "#9aedfe",
}

local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Base
hi("Normal", { fg = c.fg, bg = c.bg })
hi("Comment", { fg = c.comment, italic = true })
hi("CursorLine", { bg = c.dark_gray })
hi("Visual", { bg = "#28344a" })

-- Syntax
hi("String", { fg = c.green })
hi("Number", { fg = c.blue })
hi("Boolean", { fg = c.blue })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.blue })
hi("Keyword", { fg = c.red })
hi("Statement", { fg = c.orange })
hi("Conditional", { fg = c.red })
hi("Repeat", { fg = c.red })
hi("Operator", { fg = c.cyan })
hi("PreProc", { fg = c.orange })
hi("Type", { fg = c.aqua })
hi("Constant", { fg = c.blue })
hi("Special", { fg = c.yellow })

-- LSP / Diagnostics (if needed)
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.cyan })
hi("DiagnosticHint", { fg = c.green })

-- UI
hi("LineNr", { fg = c.comment })
hi("CursorLineNr", { fg = c.yellow })
hi("VertSplit", { fg = c.blue })
hi("StatusLine", { fg = c.fg, bg = c.dark_gray })
hi("Pmenu", { fg = c.fg, bg = c.dark_gray })
hi("PmenuSel", { fg = c.bg, bg = c.blue })

-- Treesitter (if enabled)
hi("@keyword.type", { fg = c.red }) -- or any color you prefer
hi("@function", { fg = c.blue })
hi("@variable.parameter", { fg = c.fg })
hi("@variable.member", { fg = c.fg })
hi("@keyword.import", { fg = c.red }) -- or any color you like
hi("@string", { fg = c.green })
hi("@constant", { fg = c.fg })
hi("@module", { fg = c.fg })
hi("@attribute", { fg = c.fg })
hi("@type", { fg = c.blue })
hi("@property", { fg = c.yellow })
hi("@punctuation", { fg = c.fg })
hi("@variable.builtin", { fg = c.fg }) -- or any color you want

-- place the cursor on something and it can capture the know what treesitter group is used
-- :lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))

-- Notify plugin (if used)
hi("NotifyBackground", { bg = c.bg })
