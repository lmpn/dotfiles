return {
    -- Colorscheme
    { "ellisonleao/gruvbox.nvim", priority = 1000 }, -- Load before any other start plugins

    -- Git related plugins; noconf
    'tpope/vim-fugitive',

    -- Open GitHub URLs, omni-completion for issues, commits, etc; noconf
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically; noconf
    'tpope/vim-sleuth',

    -- Status line; noconf
    'vim-airline/vim-airline',

    -- Vim sugar for the UNIX shell commands that need it the most.; noconf
    'tpope/vim-eunuch',

    -- "gc" to comment visual regions/lines; noconf
    { 'numToStr/Comment.nvim',    opts = {} },

    -- Context when scrolling in files; noconf
    "wellle/context.vim",

    -- Diagnostics; noconf
    { "folke/trouble.nvim", opts = {}, cmd = "Trouble", },

    -- Command fzf; noconf
    {
        'sudormrfbin/cheatsheet.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim'
        }
    },

    -- Tabline plugin
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        version = '^1.0.0',
    },

    -- Add indentation guides even on blank lines
    {
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
        config = function()
            require("plugins.config.ibl")
        end,

    },

    -- Telescope fzf
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        config = function()
            require("plugins.config.telescope")
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-tree/nvim-web-devicons",
            {
                -- only load if make is available
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function() return vim.fn.executable 'make' == 1 end,
            },
        },
    },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.config.gitsigns")
        end,
    },

    -- Completions
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.config.nvim-cmp")
        end,
        dependencies = {
            "L3MON4D3/LuaSnip",                    -- snippet engine
            "saadparwaiz1/cmp_luasnip",            -- for autocompletion
            "rafamadriz/friendly-snippets",        -- useful snippets
            "hrsh7th/cmp-buffer",                  -- source for text in buffer
            "hrsh7th/cmp-path",                    -- source for file system paths
            "hrsh7th/cmp-nvim-lsp",                -- for autocompletion
            "hrsh7th/cmp-nvim-lsp-signature-help", -- function parameter hints
            "onsails/lspkind.nvim",                -- vs-code like icons for autocompletion
        },
    },                                             -- completion plugin


    -- LSP Configuration & Plugins
    {
        -- NOTE: This is where your plugins related to LSP can be installed.
        --  The configuration is done below. Search for lspconfig to find it below.
        'neovim/nvim-lspconfig',
        config = function()
            require("plugins.config.lspconfig")
        end,
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim',       opts = {} },
            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
        opts = {
            inlay_hints = { enabled = true },
        },
    },

    -- AI Plugin
    {
        "David-Kunz/gen.nvim",
        config = function()
            require("plugins.config.gen")
        end
    },

    -- Useful plugin to show you pending keybinds.; noconf
    {
        'folke/which-key.nvim',
        config = function()
            require("plugins.config.whichkey")
        end
    },

    -- Highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("plugins.config.treesitter")
        end,
    },

    -- Debugging
    {
        'mfussenegger/nvim-dap',
        config = function()
            require("plugins.config.dap")
            require("plugins.config.go-dap")   -- debug adapter
            require("plugins.config.rust-dap") -- debug adapter
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end,
    },

    -- Golang
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("plugins.config.go")
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    -- Prettier
    {
        "MunifTanjim/prettier.nvim",
    },
}
