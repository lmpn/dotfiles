-- get a reference to keymaps
local keymaps = require("core.keymaps")

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    print("lspconfig did not load")
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    print("cmp-nvim-lsp did not load")
    return
end

-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("mason did not load")
    return
end

-- import mason-lspconfig plugin safely
local mason_lsp_config_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status then
    print("mason-lspconfig did not load")
    return
end


-- enable keybinds only for when lsp server available
local on_attach = function(_, bufnr)
    -- assign keymaps meant for lsp features
    keymaps.on_attach(bufnr)
end

local servers = {
    rust_analyzer = {},
    lua_ls = {},
    html = { filetypes = { "htmldjango", "html" } },
    cssls = {},
    bashls = {},
    marksman = {},
    jsonls = {},
    yamlls = {},
    ts_ls = {},
    gopls = {
        analyses = {
            unusedparams = true,
        },
        completeUnimported = true,
        staticcheck = true,
        gofumpt = true,
        buildFlags = { "-tags=testutils" },
    },
}

-- enable mason
mason.setup()

-- enable mason_lspconfig
mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = vim.tbl_keys(servers),
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- used to enable autocompletion (assign to every lsp server config)
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local debounce = 150

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
            flags = { debounce_text_changes = debounce },
        }
    end,
}



-- Switch for controlling whether you want autoformatting.
--  Use :KickstartFormatToggle to toggle autoformatting on or off
local format_is_enabled = true
vim.api.nvim_create_user_command('KickstartFormatToggle', function()
    format_is_enabled = not format_is_enabled
    print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})

-- Create an augroup that is used for managing our formatting autocmds.
--      We need one augroup per client to make sure that multiple clients
--      can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
    if not _augroups[client.id] then
        local group_name = 'kickstart-lsp-format-' .. client.name
        local id = vim.api.nvim_create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
    end

    return _augroups[client.id]
end

-- Whenever an LSP attaches to a buffer, we will run this function.
--
-- See `:help LspAttach` for more information about this autocmd event.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
    -- This is where we attach the autoformatting for reasonable clients
    callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if client and not client.server_capabilities.documentFormattingProvider then
            return
        end

        -- Tsserver usually works poorly. Sorry you work with bad languages
        -- You can remove this line if you know what you're doing :)
        if client and client.name == 'tsserver' then
            return
        end

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
                if not format_is_enabled then
                    return
                end

                vim.lsp.buf.format {
                    async = false,
                    filter = function(c)
                        return client and c.id == client.id
                    end,
                }
            end,
        })
    end,
})
