local vim = vim
local lualine = require "lualine"
local gps = require "nvim-gps"

lualine.setup {
  sections = {
    lualine_c = {
      "lsp_progress",
      { gps.get_location, cond = gps.is_available },
    },
  },
  options = {
    theme = vim.g.colors_name,
    disabled_filetypes = {
      "alpha",
    },
    section_separators = "",
    component_separators = "│",
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "symbols-outline",
  },
}
