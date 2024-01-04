-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
	    vim.cmd('colorscheme rose-pine')
	end
    })
    use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
    }
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {'williamboman/mason.nvim'},           -- Optional
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	  }
	}
	use "lukas-reineke/indent-blankline.nvim"
	use { "sitiom/nvim-numbertoggle" }
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
	use {
	  'NeogitOrg/neogit',
	  requires = {
		"nvim-lua/plenary.nvim",         -- required
		"sindrets/diffview.nvim",        -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	  },
	}
	use {
	  "nvim-telescope/telescope-file-browser.nvim",
	  requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-web-devicons" }
	}
	-- use {"ellisonleao/gruvbox.nvim",config = function() vim.cmd.colorscheme("gruvbox") end }
	use {
	  "windwp/nvim-autopairs",
	  config = function() require("nvim-autopairs").setup {} end
	}
	use {"christoomey/vim-tmux-navigator"}
	use {"luisiacc/gruvbox-baby", config = function() vim.cmd.colorscheme("gruvbox-baby") end }
  end)
