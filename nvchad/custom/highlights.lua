-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  NvDashAscii = {
    fg = "#565c62",
    bg = "black",
    -- fg = "red",
    -- bg = "one_bg",
  },
  NvDashButtons = {
    fg = "#565c62",
    bg = "black",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
