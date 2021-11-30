local use = require('packer').use





print('Hello From lua init file')

vim.wo.colorcolumn = '80'
-- use space as a the leader key
vim.g.mapleader = ' '

vim.g['zoom#statustext'] = 'Z'

local set = vim.opt


-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.autoindent = true

-- set.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
-- set.list=true

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'hrsh7th/nvim-cmp', branch = 'main'
	}
	-- Simple plugins can be specified as strings
	use '9mm/vim-closer'

	-- Lazy loading:
	-- Load on specific commands
	use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

	-- Load on an autocommand event
	use {'andymass/vim-matchup', event = 'VimEnter'}

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	-- use {
	--   'w0rp/ale',
	--    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
	--    cmd = 'ALEEnable',
	--   config = 'vim.cmd[[ALEEnable]]'
	--  }

	-- Plugins can have dependencies on other plugins
	use {
		'haorenW1025/completion-nvim',
		opt = true,
		requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
	}

	-- Plugins can also depend on rocks from luarocks.org:
	-- use {
	--   'my/supercoolplugin',
	--   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
	-- }

	-- You can specify rocks in isolation
	use_rocks 'penlight'
	use_rocks {'lua-resty-http', 'lpeg'}

	-- Local plugins can be included
	--
	--  use '~/projects/personal/hover.nvim'

	-- Plugins can have post-install/update hooks
	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'mfussenegger/nvim-jdtls'

	require'nvim-treesitter.configs'.setup {
		-- Modules and its options go here
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = {
			enable = true;
		},
		textobjects = { enable = true },
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
		-- Post-install/update hook with call of vimscript function with argument
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	-- Use specific branch, dependency and run lua file after load

	-- Use dependency and run lua function after load
	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require 'statusline' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}


	use { 'morhetz/gruvbox' }

	use({
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				-- overwrite default configuration
				-- here, e.g. to enable default bindings
				copy_sync = {
					-- enables copy sync and overwrites all register actions to
					-- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
					enable = true,
				},
				navigation = {
					-- enables default keybindings (C-hjkl) for normal mode
					enable_default_keybindings = true,
				},
				resize = {
					-- enables default keybindings (A-hjkl) for normal mode
					enable_default_keybindings = true,
				}
			})
		end
	})
	use {
		'williamboman/nvim-lsp-installer',
		requires = {
			'neovim/nvim-lspconfig',
			{'ms-jpq/coq_nvim', branch = 'coq',
				event = 'VimEnter',
				config =  'vim.cmd[[COQnow]]'
			},
			{'ms-jpq/coq.artifacts', branch = 'artifacts'},
		}
	}
	-- which-key same as emacs which-key
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use 'jlcrochet/vim-razor'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
--	use 'ycm-core/YouCompleteMe'
end)





