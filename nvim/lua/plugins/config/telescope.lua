-- import telescope plugin safely
local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    print("telescope did not load")
    return
end

-- import telescope actions safely
local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
    print("telescope actions did not load")
    return
end

-- configure telescope
telescope.setup({
    -- configure custom mappings
    defaults = {
        file_ignore_patterns = { "target", "build", "node_modules" },
        path_display = { "truncate" }, -- hidden, tail, absolute, smart, shorten, truncate (truncate can = a number like "truncate = 3")
        preview = {
            treesitter = false,        -- Disable treesitter in the preview window so large files don't hang
            filesize_limit = 0.1,
            timeout = 250,
        },
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    pickers = {
        buffers = {
            initial_mode = "normal",
            sort_mru = true, -- sort by last open buffer
            mappings = {
                n = {
                    ["d"] = actions.delete_buffer,
                },
            },
        },
    },
})

-- -- Telescope live_grep in git root
-- -- Function to find the git root directory based on the current buffer's path
-- local function find_git_root()
--     -- Use the current buffer's path as the starting point for the git search
--     local current_file = vim.api.nvim_buf_get_name(0)
--     local current_dir
--     local cwd = vim.fn.getcwd()
--     -- If the buffer is not associated with a file, return nil
--     if current_file == '' then
--         current_dir = cwd
--     else
--         -- Extract the directory from the current file's path
--         current_dir = vim.fn.fnamemodify(current_file, ':h')
--     end
--
--     -- Find the Git root directory from the current file's path
--     local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
--     if vim.v.shell_error ~= 0 then
--         print 'Not a git repository. Searching on current working directory'
--         return cwd
--     end
--     return git_root
-- end
--
-- -- Custom live_grep function to search in git root
-- local function live_grep_git_root()
--     local git_root = find_git_root()
--     if git_root then
--         require('telescope.builtin').live_grep {
--             search_dirs = { git_root },
--         }
--     end
-- end
--
-- vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- load fzf exension for faster searching
telescope.load_extension("fzf")
