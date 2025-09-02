-- REMOVE THE LINE BELOW TO ACTIVATE THIS FILE
-- if true then return end

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure Lua, so anything that doesn't
-- fit in the normal config locations above can go here.

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Function to apply transparent highlights
local function set_transparency()
  vim.cmd [[
    highlight Normal guibg=NONE
    highlight NormalNC guibg=NONE
    highlight NormalFloat guibg=NONE
    highlight FloatBorder guibg=NONE
    highlight Pmenu guibg=NONE

    " Neo-tree specific highlight overrides
    highlight NeoTreeNormal guibg=NONE
    highlight NeoTreeNormalNC guibg=NONE
    highlight NeoTreeEndOfBuffer guibg=NONE
    highlight NeoTreeFloatTitle guibg=NONE
    highlight NeoTreeFloatBorder guibg=NONE
    highlight NeoTreeWinSeparator guibg=NONE
  ]]
end

-- Apply transparency immediately
set_transparency()

-- Reapply after any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparency,
})

require("notify").setup {
  background_colour = "#000000",
}
