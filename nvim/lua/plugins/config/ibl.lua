-- import nvim-cmp plugin safely
local status, ibl = pcall(require, "ibl")
if not status then
    print("ibl did not load")
    return
end
local ibl_hooks_status, ibl_hooks = pcall(require, "ibl.hooks")
if not ibl_hooks_status then
    print("ibl_hooks did not load")
    return
end

local highlight = {
    "greyish",
}

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "greyish", { fg = "#5b5b5b" })
end)

ibl.setup { indent = { highlight = highlight } }
