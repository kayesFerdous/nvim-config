-- ~/.config/nvim/lua/user/init.lua

return {
  -- Auto-activate venv on startup
  on_event = { -- AstroNvim v4+ event hooks
    "User AstroFile", -- Triggers after AstroNvim fully loads
    function()
      local venv = require "venv-selector"
      if not venv.is_venv_active() then venv.retrieve_from_cache() end
    end,
  },

  -- Optional: Keybindings
  mappings = {
    n = {
      ["<leader>pv"] = { "<cmd>VenvSelect<cr>", desc = "Select Python Venv" },
    },
  },

  -- ADD THIS BLOCK FOR DISCORD PRESENCE!
  -- This tells AstroNvim to configure the 'presence.nvim' plugin.
  {
    "lukas-reineke/presence.nvim",
    -- 'opts' is where you pass configuration options to the plugin.
    opts = {
      -- This is the crucial setting for your issue!
      -- 'debounce_time' tells the plugin to wait for 500 milliseconds
      -- of inactivity (no file changes, typing, etc.) before sending an
      -- update to Discord. This prevents the "time elapsed" counter
      -- from resetting every time you quickly switch files within the same project.
      -- If 500ms isn't enough, you can try 1000ms (1 second).
      debounce_time = 500,

      -- You can also customize the text shown in Discord if you want:
      -- rich_presence = {
      details = "Working on: {file_name}", -- Shows the current file
      state = "In: {workspace_name}", -- Shows the project folder name
      --   -- You can add/change large_text, small_text, etc.
      --   -- Check the presence.nvim documentation for all available options.
      -- },
    },
  },
}
