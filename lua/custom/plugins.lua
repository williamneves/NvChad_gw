local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- ASTRO plugin
  --

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Surround plugin
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- Copilot plugin
  {
    "zbirenbaum/copilot.lua",
    -- Lazy load when event occurs. Events are triggered
    -- as mentioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
    -- You can also have it load at immediately at
    -- startup by commenting above and uncommenting below:
    -- lazy = false
    opts = overrides.copilot,
  },
  -- ChatGPT plugin
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "pass show openai/key",
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = overrides.treesitter,
  },
  --
  -- Text objects
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   lazy = true,
  --   config = function()
  --     require("nvim-treesitter.configs").setup {
  --       textobjects = {
  --         select = {
  --           enable = true,
  --
  --           -- Automatically jump forward to textobj, similar to targets.vim
  --           lookahead = true,
  --
  --           keymaps = {
  --             -- You can use the capture groups defined in textobjects.scm
  --             ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
  --             ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
  --             ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
  --             ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
  --
  --             ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
  --             ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
  --
  --             ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
  --             ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
  --
  --             ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
  --             ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
  --
  --             ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
  --             ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

  --             ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
  --             ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
  --
  --             ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
  --             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
