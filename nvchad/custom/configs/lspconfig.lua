local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "rust_analyzer",
  "lua_ls",
  "volar",
  "tailwindcss",
  -- "pylsp",
  "jedi_language_server",
  -- "shfmt"
}

for _, lsp in ipairs(servers) do
  if lsp == "rust_analyzer" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "rust" },
      root_dir = lspconfig.util.root_pattern "Cargo.toml",
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

--
-- lspconfig.pyright.setup { blabla}
