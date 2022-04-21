---------------------------
-- Install packer to manage plugins
---------------------------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })
---------------------------


---------------------------
-- Plugins
---------------------------
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    -- For Formatting and more lsp
    use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'preservim/nerdtree'
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'mattn/emmet-vim'

    -- Colorschemes
    use 'gruvbox-community/gruvbox' -- Best Colorscheme eva
    use 'tomasiser/vim-code-dark'
    use 'joshdick/onedark.vim'
end)
---------------------------


---------------------------
-- General Options
---------------------------
vim.cmd 'source ~/.config/nvim/vim/options.vim'
---------------------------


---------------------------
-- General Mappings
---------------------------
vim.cmd 'source ~/.config/nvim/vim/mappings.vim'
---------------------------


---------------------------
-- Plugin Config, Enable, and Mappings
---------------------------
require('andy.treesitter')
require('andy.telescope')
require('andy.lsp')
require('andy.cmp')
require('andy.null')
---------------------------


---------------------------
-- Cmp Kind Icon's Colors
-- NOTE: Always source cmp_color.vim last
---------------------------
vim.cmd 'source ~/.config/nvim/vim/cmp_color.vim'
---------------------------


---------------------------
-- UltiSnips Config
---------------------------
vim.cmd 'source ~/.config/nvim/vim/ultisnip.vim'
---------------------------
