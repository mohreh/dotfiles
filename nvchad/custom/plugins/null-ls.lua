local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
   b.formatting.codespell,
   b.diagnostics.eslint,
   b.code_actions.eslint,
   b.formatting.prettier,
   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "typescript" } },
   b.formatting.deno_fmt,

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local on_attach = function(client)
   if client.resolved_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
   end
end

local M = {}
M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
      -- format on save
      on_attach = on_attach,
   }
end
return M
