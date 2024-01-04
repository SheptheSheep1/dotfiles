require("ibrahim.lualine")
require("ibrahim.telefibrowser")
require("ibrahim.packer")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.clipboard = unnamedplus
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.incsearch = true
vim.opt.updatetime = 50

-- indent-blankline
require("ibl").setup()

-- init.lua
local neogit = require('neogit')
neogit.setup {}

-- Telescope File Browser bindings
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- set line-wrapping keymap
vim.api.nvim_set_keymap(
  "n",
  "<space>wr",
  ":set wrap<CR>",
  { noremap = true }
)
