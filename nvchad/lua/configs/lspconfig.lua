-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
    html = {},
    cssls = {},
    gopls = {
        analyses = {
            unusedparams = true,
        },
        completeUnimported = true,
        staticcheck = true,
        gofumpt = true,
        buildFlags = { "-tags=testutils" },
    }

}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for name, lsp in pairs(servers) do
    lspconfig[name].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        settings = lsp
    }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
