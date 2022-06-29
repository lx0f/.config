local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system(
        {
            'git', 
            'clone', 
            '--depth', 
            '1', 
            'https://github.com/wbthomason/packer.nvim', 
            install_path
        }
    )
end

local plugins = {
    -- Plugin manager
    ['wbthomason/packer.nvim'] = {},

    -- Optimiser
    ['lewis6991/impatient.nvim'] = {},

    -- Lua functions
    ['nvim-lua/plenary.nvim'] = { module = 'plenary' },

    -- Popup API
    ['nvim-lua/popup.nvim'] = {},

    -- Indent detection
    ['Darazaki/indent-o-matic'] = {
        event = "BufReadPost",
        config = function()
            require "configs.indent-o-matic"
        end,
    },

    -- Notification enhancer
    ["rcarriga/nvim-notify"] = {
        event = "VimEnter",
        config = function()
            require "configs.notify"
        end,
    },

    -- Neovim UI enhancer
    ["MunifTanjim/nui.nvim"] = { module = "nui" },

    -- Cursorhold fix
    ["antoinemadec/FixCursorHold.nvim"] = {
        event = { "BufRead", "BufNewFile" },
        config = function()
            vim.g.cursorhold_updatetime = 100
        end,
    },

    -- Smarter splits
    ["mrjones2014/smart-splits.nvim"] = {
        module = "smart-splits",
        config = function()
            require "configs.smart-splits"
        end,
    },

    -- Icons
    ["kyazdani42/nvim-web-devicons"] = {
        event = "VimEnter",
        config = function()
            require "configs.icons"
        end,
    },

    -- Better buffer closing
    ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },

    -- File explorer
    ["nvim-neo-tree/neo-tree.nvim"] = {
        branch = "v2.x",
        module = "neo-tree",
        cmd = "Neotree",
        requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        setup = function()
            vim.g.neo_tree_remove_legacy_commands = true
        end,
        config = function()
            require "configs.neo-tree"
        end,
    },

    -- Statusline
    ["nvim-lualine/lualine.nvim"] = {
        after = "nvim-web-devicons",
        config = function()
            require "configs.lualine"
        end,
    },

    -- Syntax highlighting
    ["nvim-treesitter/nvim-treesitter"] = {
        run = ":TSUpdate",
        event = { "BufRead", "BufNewFile" },
        cmd = {
            "TSInstall",
            "TSInstallInfo",
            "TSInstallSync",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
            "TSDisableAll",
            "TSEnableAll",
        },
        config = function()
            require "configs.treesitter"
        end,
    },

    -- Completion engine
    ["hrsh7th/nvim-cmp"] = {
        event = "InsertEnter",
        config = function()
            require "configs.cmp"
        end,
    },
    
    -- Snippet collection
    ["rafamadriz/friendly-snippets"] = { opt = true },

    -- Snippet engine
    ["L3MON4D3/LuaSnip"] = {
        module = "luasnip",
        wants = "friendly-snippets",
        config = function()
            require "configs.luasnip"
        end,
    },

    -- Snippet completion source
    ["saadparwaiz1/cmp_luasnip"] = {
        after = "nvim-cmp",
    },

    -- Buffer completion source
    ["hrsh7th/cmp-buffer"] = {
        after = "nvim-cmp",
      },

    -- Path completion source
    ["hrsh7th/cmp-path"] = {
        after = "nvim-cmp",
    },

    -- LSP completion source
    ["hrsh7th/cmp-nvim-lsp"] = {
        after = "nvim-cmp",
    },

    -- Built-in LSP
    ["neovim/nvim-lspconfig"] = { event = "VimEnter" },

    -- LSP manager
    ["williamboman/nvim-lsp-installer"] = {
        after = "nvim-lspconfig",
        config = function()
            require "configs.nvim-lsp-installer"
            require "configs.lsp"
        end,
    },

    -- Parenthesis highlighting
    ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

    -- Autoclose tags
    ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

    -- Context based commenting
    ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

    -- Formatting and linting
    ["jose-elias-alvarez/null-ls.nvim"] = {
        event = { "BufRead", "BufNewFile" },
        config = function()
            require "configs.null-ls"
        end,
    },

    -- Fuzzy finder
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        module = "telescope",
        config = function()
            require "configs.telescope"
        end,
    },

    -- Fuzzy finder syntax support
    [("nvim-telescope/telescope-%s-native.nvim"):format(vim.fn.has "win32" == 1 and "fzy" or "fzf")] = {
        after = "telescope.nvim",
        run = vim.fn.has "win32" ~= 1 and "make" or nil,
        config = function()
            require("telescope").load_extension(vim.fn.has "win32" == 1 and "fzy_native" or "fzf")
        end,
    },

    -- Colorschemes
    ["Mofiqul/vscode.nvim"] = {},
    ["RRethy/nvim-base16"] = {}

}

return require('packer').startup(
    {
        function(use)
            for key, plugin in pairs(plugins) do
                plugin[1] = key
                use(plugin)
            end

            if packer_bootstrap then
                require('packer').sync()
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require('packer.util').float { border = 'rounded' }
                end
            },
	    auto_clean = true,
	    compile_on_sync = true,
        },
    }
)
