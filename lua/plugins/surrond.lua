-- ~/.config/nvim/lua/user/plugins/surround.lua
return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy", -- This helps lazy-load the plugin, making AstroNvim start faster
    config = function()
      require("nvim-surround").setup {
        -- You can put any custom configuration for nvim-surround here.
        -- For now, we'll just use the defaults, so an empty table is fine.
      }
    end,
  },
}
