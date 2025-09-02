-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- You can also add or configure plugins by creating files in this plugins/ folder
-- Here are some examples:
---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_enable = true,
      hint_prefix = "󰛩 ",
      hint_scheme = "String",
      hi_parameter = "LspSignatureActiveParameter",
    },
    config = function(_, opts) require("lsp_signature").setup(opts) end,
  },

  -- == Add Venv-Selector Here ==
  -- {
  --   "linux-cultist/venv-selector.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" }, -- Already in AstroNvim
  --   event = "VeryLazy", -- Recommended lazy-loading trigger
  --   opts = {
  --     name = { "venv", ".venv", ".env" },
  --     parents = 3, -- Search more parent directories
  --     search_venv_managers = true, -- Detect Poetry/Pipenv/Conda
  --     dap_enabled = true, -- Auto-configure debugpy
  --   },
  --   keys = {
  --     { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Python: Select VirtualEnv" },
  --   },
  -- },
  -- == Examples of Overriding Plugins ==
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  -- example lazy.nvim install setup
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    -- vim.cmd.colorscheme "lackluster"
    -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme "lackluster-min"
    vim.cmd.colorscheme "lackluster-night"
  end,
}
