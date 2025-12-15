require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" , "pyright", "clangd"}
})

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", require("fzf-lua").lsp_references, {})

vim.lsp.enable({"lua_ls", "clangd", "pyright"})
vim.lsp.config("clangd", {
	init_options={
		-- for true, false, etc. (copied from xnacly.me)
		fallback_flags={'--std=c23'}
	}
})
vim.cmd[[let g:vimtex_compiler_latexmk = {
            \ 'out_dir' : 'build',
            \}]]
