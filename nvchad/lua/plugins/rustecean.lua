return {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
    ft = "rust",
    config = function()
        local nvlsp = require "nvchad.configs.lspconfig"

        vim.g.rustaceanvim = {
            server = {
                on_attach = nvlsp.on_attach,
                default_settings = { -- rust-analyzer language server configuration 
                    ['rust-analyzer'] = {
                    },
                },
            },
        }
    end
}
