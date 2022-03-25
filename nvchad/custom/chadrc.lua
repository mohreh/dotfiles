-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

local myPlugins = require "custom.plugins"
local plugin_conf = require "custom.plugins.configs"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "chadtain",
}

M.plugins = {
   status = {
      nvim_tree = true,
      alpha = true, -- dashboard
      colorizer = true,
      dashboard = true,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = plugin_conf.treesitter,
      nvim_tree = plugin_conf.nvimtree,
   },

    install = myPlugins
}

return M
