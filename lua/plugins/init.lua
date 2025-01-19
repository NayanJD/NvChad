return {
  -- These plugins are already installed by NvChad. Below adds some
  -- more options to those plugins.
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "go",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        relativenumber = true,
        adaptive_size = true,
      },
    },
  },

  -- Plugins other than NvChad

  -- Debugger for languages
  {
    "mfussenegger/nvim-dap",
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
}
