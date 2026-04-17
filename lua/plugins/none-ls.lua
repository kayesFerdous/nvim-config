-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local user_on_init = opts.on_init

    -- Guard null-ls supports_method during startup races (e.g. vim-illuminate CursorMoved).
    opts.on_init = function(client, ...)
      local original_supports_method = client.supports_method
      if type(original_supports_method) == "function" then
        client.supports_method = function(first, second, ...)
          local ok, supported = pcall(original_supports_method, first, second, ...)
          if not ok then return false end
          return supported
        end
      end

      if type(user_on_init) == "function" then user_on_init(client, ...) end
    end

    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    })
  end,
}
