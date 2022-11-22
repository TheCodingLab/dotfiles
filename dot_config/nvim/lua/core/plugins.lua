-- Automaticaly install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }

  print 'Cloning packer...'
  vim.cmd [[packadd packer.nvim]]
end

local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then
  return
end

packer.startup {
  function(use)
    -- general
    use { 'wbthomason/packer.nvim' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'lewis6991/impatient.nvim' }
    use { 'moll/vim-bbye' }

    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require 'configs.nvim-tree'.config()
      end,
    }

    use {
      'akinsho/bufferline.nvim',
      after = 'nvim-web-devicons',
      config = function()
        require('configs.bufferline').config()
      end,
    }

    use {
      'nvim-lualine/lualine.nvim',
      after = 'bufferline.nvim',
      config = function()
        require('configs.lualine').config()
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('configs.gitsigns').config()
      end,
    }

    use {
      'windwp/nvim-autopairs',
      config = function()
        require('configs.autopairs').config()
      end,
    }

    -- commenting
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('configs.comment').config()
      end,
    }

    use { 'JoosepAlviste/nvim-ts-context-commentstring' }

    -- language server protocol
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('configs.lsp.init').config()
      end,
    }

    use {
      'williamboman/mason.nvim',
      config = function()
        require('configs.lsp.mason').config()
      end,
    }

    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require('configs.null-ls').config()
      end,
    }

    use {
      'tami5/lspsaga.nvim',
      config = function()
        require('configs.lsp.lspsaga').config()
      end,
    }

    use {
      'folke/trouble.nvim',
      config = function()
        require 'configs.lsp.trouble'.config()
      end,
    }

    use { 'williamboman/mason-lspconfig.nvim' }

    -- snippets engine
    use {
      'L3MON4D3/LuaSnip',
      config = function()
        require('configs.luasnip').config()
      end,
    }

    use { 'rafamadriz/friendly-snippets' }

    -- completion engine
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('configs.cmp').config()
      end,
    }

    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    -- telescope (fuzzy finder)
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      config = function()
        require('configs.telescope').config()
      end,
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('configs.treesitter').config()
      end,
    }

    use { 'p00f/nvim-ts-rainbow' }
    use { 'windwp/nvim-ts-autotag' }

    -- theme
    use { 'kyazdani42/nvim-web-devicons' }
    use {
      'navarasu/onedark.nvim',
      config = function()
        require('configs.theme').config()
      end,
    }

    -- user local plugins
    local status_ok, user = pcall(require, 'user.plugins')
    if status_ok then
      user.setup(use)
    end

    -- install plugins automatically when first starting neovim
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
  end,

  config = {
    compile_path = vim.fn.stdpath 'config' .. '/lua/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'rounded' }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
    },
    auto_clean = true,
    compile_on_sync = true,
  },
}
