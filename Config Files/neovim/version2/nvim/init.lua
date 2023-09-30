require("ibrahim")
require("ibrahim.packer")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
require("indent_blankline").setup {
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
}
vim.opt.number = true
vim.opt.clipboard = unnamedplus
