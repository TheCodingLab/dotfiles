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

    use { 'kyazdani42/nvim-tree.lua' }

    use { 'akinsho/bufferline.nvim' }
    use { 'nvim-lualine/lualine.nvim' }

    use { 'lewis6991/gitsigns.nvim' }

    use { 'windwp/nvim-autopairs' }

    -- commenting
    use { 'numToStr/Comment.nvim' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }

    -- language server protocol
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    use { 'tami5/lspsaga.nvim' }
    use { 'folke/trouble.nvim' }

    -- debugging
    use { 'mfussenegger/nvim-dap' }

    -- snippets engine
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }

    -- completion engine
    use { 'hrsh7th/nvim-cmp' }

    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    -- telescope (fuzzy finder)
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'windwp/nvim-ts-autotag' }

    -- theme
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'navarasu/onedark.nvim' }

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
