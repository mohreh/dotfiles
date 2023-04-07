local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.completion.spell,
  b.diagnostics.codespell,
  b.diagnostics.misspell,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  b.code_actions.eslint_d,
  b.formatting.prettier,
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "typescript" } },
  b.formatting.deno_fmt,

  b.formatting.rustywind,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,

  -- Rust
  b.formatting.rustfmt.with {
    extra_args = function(params)
      local cargo_toml = params.root .. "/" .. "Cargo.toml"
      local fd = vim.loop.fs_open(cargo_toml, "r", 438)
      if not fd then
        return
      end
      local stat = vim.loop.fs_fstat(fd)
      local data = vim.loop.fs_read(fd, stat.size, 0)
      vim.loop.fs_close(fd)
      for _, line in ipairs(vim.split(data, "\n")) do
        local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
        -- regex maybe wrong.
        if edition then
          return { "--edition=" .. edition }
        end
      end
    end,
  },
}

null_ls.setup {
  debug = true,
  sources = sources,

  -- format on save
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format(nil, 2000)"
    end
  end,
}
