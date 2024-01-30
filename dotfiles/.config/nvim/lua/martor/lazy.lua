local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                styles = {
                    italic = false,

                },
                disable_background = true,
                disable_float_background = true,
            })
            vim.cmd('colorscheme rose-pine')
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'nvim-treesitter/playground',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'numToStr/Comment.nvim',

    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

})
