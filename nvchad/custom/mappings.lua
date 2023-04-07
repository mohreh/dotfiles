---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>cc"] = { "<cmd> Telescope <CR>", "Telescope" },
    ["<leader>gr"] = { "<cmd> Telescope lsp_references <CR>", "[G]oto [R]eferences" },
    ["<leader>gi"] = { "<cmd> Telescope lsp_implementations <CR>", "[G]oto [I]mplementation" },
    ["<leader>D"] = { "<cmd> Telescope lsp_type_definitions <CR>", "Type [D]efinition" },
    ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "[D]document [S]ymbols" },
    ["<leader>ws"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "[W]workspace [S]ymbols" },

    ["<leader>jc"] = { "<cmd> HopChar2 <CR>", "[J]ump To [C]har" },
    ["<leader>jl"] = { "<cmd> HopLineStart <CR>", "[J]ump To [L]ine" },
    ["<leader>jp"] = { "<cmd> HopPattern <CR>", "[J]ump To [P]attern" },
    ["<leader>jw"] = { "<cmd> HopWord <CR>", "[J]ump To [W]ord" },
  },
}

-- more keybinds!

return M
