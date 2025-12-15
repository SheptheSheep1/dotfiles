-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.cmd[[set clipboard+=unnamedplus]]

vim.cmd[[set conceallevel=1]]
vim.cmd[[let g:tex_conceal='abdmg']]

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		--{ import = "plugins" },
		{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
		-- {
		-- 	"OXY2DEV/markview.nvim",
		-- 	lazy = false,

		-- 	-- For blink.cmp's completion
		-- 	-- source
		-- 	-- dependencies = {
		-- 	--     "saghen/blink.cmp"
		-- 	-- },
		-- },
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.8',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function ()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" , "markdown", "markdown_inline", "query"},
					sync_install = false,
					highlight = {
						enable = true,
						disable = {"latex"},
					},
					ignore_install = { "latex" },
					indent = { enable = true },
				})

			end
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup {}
			end,
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
		},
		{"sitiom/nvim-numbertoggle"},
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-nvim-lsp'},
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" , "saadparwaiz1/cmp_luasnip"},
			run = "make install_jsregexp"
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},
		{
			"lervag/vimtex",
			lazy = false,     -- we don't want to lazy load VimTeX
			-- tag = "v2.15", -- uncomment to pin to a specific release
			init = function()
				-- VimTeX configuration goes here, e.g.
				vim.g.vimtex_view_method = "zathura"
			end
		},
		{
			"iurimateus/luasnip-latex-snippets.nvim",
			-- vimtex isn't required if using treesitter
			dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
			config = function()
				require'luasnip-latex-snippets'.setup()
				-- or setup({ use_treesitter = true })
				require("luasnip").config.setup { enable_autosnippets = true }
			end
		},
		{
			"tadmccorkle/markdown.nvim",
			ft = "markdown", -- or 'event = "VeryLazy"'
			opts = {
				-- configuration here or empty for defaults
			},
		},
		--{
		--	'MeanderingProgrammer/render-markdown.nvim',
		--	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		--	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		--	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		--	---@module 'render-markdown'
		--	---@type render.md.UserConfig
		--	opts = {},
		--},
		{ 'alexghergh/nvim-tmux-navigation', config = function()

			local nvim_tmux_nav = require('nvim-tmux-navigation')

			nvim_tmux_nav.setup {
				disable_when_zoomed = true -- defaults to false
			}

			vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

		end
		},
		{
			'windwp/nvim-autopairs',
			event = "InsertEnter",
			config = true
			-- use opts = {} for passing setup options
			-- this is equivalent to setup({}) function
		},
		{
			'Thiago4532/mdmath.nvim',
			dependencies = {
				'nvim-treesitter/nvim-treesitter',
			},
			opts = {
				filetypes = {'markdown'},
			}

			-- The build is already done by default in lazy.nvim, so you don't need
			-- the next line, but you can use the command `:MdMath build` to rebuild
			-- if the build fails for some reason.
			-- build = ':MdMath build'
		},
		{
			"obsidian-nvim/obsidian.nvim",
			version = "*", -- recommended, use latest release instead of latest commit
			lazy = true,
			ft = "markdown",
			-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
			-- event = {
			--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
			--   -- refer to `:h file-pattern` for more examples
			--   "BufReadPre path/to/my-vault/*.md",
			--   "BufNewFile path/to/my-vault/*.md",
			-- },
			dependencies = {
				-- Required.
				"nvim-lua/plenary.nvim",

				-- see above for full list of optional dependencies ☝️
			},
			---@module 'obsidian'
			---@type obsidian.config.ClientOpts
			opts = {
				workspaces = {
					{
						name = "personal",
						path = "~/vaults/personal",
					},
					-- {
					-- 	name = "work",
					-- 	path = "~/vaults/work",
					-- },
				},
				legacy_commands = false,


			},
		},
		{
			"folke/snacks.nvim",
			---@type snacks.Config
			opts = {
				image = {
					resolve = function(path, src)
						if require("obsidian.api").path_is_note(path) then
							return require("obsidian.api").resolve_image_path(src)
						end
					end,
				}
			}
		},
		{"mbbill/undotree"},
		{
			'brianhuster/live-preview.nvim',
			dependencies = {
				'nvim-telescope/telescope.nvim',
			},
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			dependencies = { "nvim-tree/nvim-web-devicons" },
			-- or if using mini.icons/mini.nvim
			-- dependencies = { "nvim-mini/mini.icons" },
			opts = {}
		},
		{ -- This plugin
			"Zeioth/compiler.nvim",
			cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
			dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
			opts = {},
		},
		{ -- The task runner we use
			"stevearc/overseer.nvim",
			commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
			cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
			opts = {
				task_list = {
					direction = "bottom",
					min_height = 25,
					max_height = 25,
					default_detail = 1
				},
			},
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("ibl").setup()
require("nvim-tree").setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
require('livepreview.config').set()
