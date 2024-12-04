local dap_status, dap = pcall(require, "dap")
if not dap_status then
    print("dap did not load")
    return
end

dap.adapters.go = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.config/nvim/dap/debugAdapter.js' },
}
dap.configurations.go = {
    {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        showLog = false,
        program = "${file}",
        dlvToolPath = vim.fn.exepath('dlv') -- Adjust to where delve is installed
    },
}
