return {
   {
      "williamboman/nvim-lsp-installer",
   },

   {
      "glepnir/dashboard-nvim"
   },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }
}
