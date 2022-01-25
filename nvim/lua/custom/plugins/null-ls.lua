local null_ls = require "null-ls"local 
b = null_ls.builtins

local sources = {
  b.diagnostics.eslint,
  b.code_actions.eslint,
  b.formatting.prettier,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },   
  b.formatting.deno_fmt,
   
  -- Lua   
  b.formatting.stylua,   
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
  -- Shell   
  b.formatting.shfmt,   
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}
M.setup = function()   
  null_ls.setup {      
    debug = true,      
    sources = sources,
    -- format on save      
    on_attach = on  
  }
end
return M
