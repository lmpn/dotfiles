local dap_status, dap = pcall(require, "dap")
if not dap_status then
    print("dap did not load")
    return
end

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.rust = {
    {
        name = "Rust debug",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = function()
            local args = vim.fn.input('args: ')
            local words = {}
            for word in args:gmatch("%S+") do
                table.insert(words, word)
            end
            return words
        end,
    },
}
