require('packer').startup(function(use)

  -- TODO:
  -- Optimize startup speed
  -- Refactor to plugin config files for unified style
  -- More telescope extensions
  -- Learn about quickfix feature (
  -- Plugins may useful:
  -- nvim-bqf
  -- )
  --
  -- Plugins considering to be added:
  --
  -- project.nvim
  -- which-key.nvim
  -- todo-comments.nvim
  -- vim-markdown
  -- startuptime.vim
  -- vim-illuminate
  -- nvim-terminal
  -- rnvimr
  -- vim-matchup
  -- goto-preview
  --
  -- hop.nvim
  -- lightspeed.nvim

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

-- Interface Plugins
  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require'config.interface.nvim-bufferline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function () require'config.interface.lualine' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'config.interface.nvim-tree' end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function () require'config.interface.symbols-outline' end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'glepnir/dashboard-nvim',
    config = function () require'config.interface.dashboard-nvim' end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function () require'config.interface.gitsigns' end,
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function () require'colorizer'.setup() end
  }

  use {
    'romgrk/nvim-treesitter-context',
    config = function () require'config.interface.nvim-treesitter-context' end
  }

  use {
    'folke/trouble.nvim',
    config = function () require'config.interface.trouble' end,
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use {
    'rcarriga/nvim-notify',
    config = function () require'config.interface.nvim-notify' end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function () require'config.interface.indent-blankline'
    end
  }

  use {'dracula/vim', as = 'dracula'}
  use {'folke/tokyonight.nvim'}
  use {'arcticicestudio/nord-vim'}

-- Tools plugins
  use {
    'windwp/nvim-autopairs',
    config = function () require'config.tools.nvim-autopairs' end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function () require'config.tools.nvim-ts-autotag' end
  }

  use {
    'folke/zen-mode.nvim',
    config = function () require'config.tools.zen-mode' end
  }

  use {
    'terrortylor/nvim-comment',
    config = function () require'config.tools.nvim-comment' end
  }

  use {
    'ethanholz/nvim-lastplace',
    config = function () require'config.tools.nvim-lastplace' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function () require'config.tools.telescope' end,
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-project.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  use {
    'iamcco/markdown-preview.nvim',
    config = function () require'config.tools.markdown-preview' end,
    run = 'cd app && yarn install'
  }

  use {
    'lervag/vimtex',
    config = function () require'config.tools.vimtex' end
  }

  use {
    'sindrets/diffview.nvim',
    config = function () require'config.tools.diffview' end
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    config = function () require'config.tools.nvim-toggleterm' end
  }

  use {
    'kdheepak/lazygit.nvim',
    config = function () require'config.tools.lazygit' end
  }

  use {'tpope/vim-repeat'}
  use {'tpope/vim-surround'}
  use {'ellisonleao/glow.nvim'}
  use {'turbio/bracey.vim', run = 'npm install --prefix server'}

-- Language plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function () require'config.language.nvim-treesitter' end,
    requires = {
      {'nvim-treesitter/nvim-treesitter-refactor'}
    }
  }

  use {
    'sbdchd/neoformat',
    config = function () require'config.language.neoformat' end
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function () require'config.language.lsp_signature' end
  }

  use {
    'mfussenegger/nvim-dap',
    config = function () require'config.language.nvim-dap' end,
    requires = {
      {"rcarriga/nvim-dap-ui"},
      {'Pocco81/DAPInstall.nvim'},
      {'theHamsta/nvim-dap-virtual-text'}
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function () require'config.language.nvim-cmp' end,
    requires = {
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-calc'},
      {'hrsh7th/cmp-nvim-lua'},
      {'kdheepak/cmp-latex-symbols'}
    }
  }
  use {'saadparwaiz1/cmp_luasnip'}
  use {'L3MON4D3/LuaSnip'}

  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}

end)

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
