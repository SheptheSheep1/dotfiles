vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("config.lazy")
require("config.remap")
require("config.lsp_config")
require("config.completions")
-- color config
require("gruvbox").setup()
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.opt.showmode = false
