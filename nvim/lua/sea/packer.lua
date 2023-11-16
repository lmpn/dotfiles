vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function()
    use 'tanvirtin/monokai.nvim'
    use "VonHeikemen/lsp-zero.nvim"
    use "wbthomason/packer.nvim"

    -- other plugins...
    use "neovim/nvim-lspconfig" 
    use "simrat39/rust-tools.nvim"
    use "hrsh7th/nvim-cmp" 

    -- LSP completion source:
    use "hrsh7th/cmp-nvim-lsp"

    -- Useful completion sources:
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-vsnip"                             
    use "hrsh7th/cmp-path"                              
    use "hrsh7th/cmp-buffer"                            
    use "hrsh7th/vim-vsnip"

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end
    })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use "puremourning/vimspector"

    use "voldikss/vim-floaterm"

    use({
        "nvim-telescope/telescope.nvim",
        requires = { {"nvim-lua/plenary.nvim"} }
    })

    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("folke/trouble.nvim")

    use 'preservim/tagbar'

    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
end)
