local whichkey_status, whichkey = pcall(require, "which-key")
if not whichkey_status then
    print("whichkey did not load")
    return
end
-- document existing key chains
whichkey.add(
    {
        { "", group = "Normal <A>" },
        { "", group = "[S]earch" },
        { "", desc = "<leader>r_",  hidden = true },
        { "", group = "[R]ename" },
        { "", desc = "<leader>s_",  hidden = true },
        { "", desc = "<leader>t_",  hidden = true },
        { "", group = "[T]oggle" },
        { "", group = "[W]orkspace" },
        { "", desc = "<leader>h_",  hidden = true },
        { "", desc = "<leader>g_",  hidden = true },
        { "", desc = "<leader>c_",  hidden = true },
        { "", group = "[C]ode" },
        { "", group = "Git [H]unk" },
        { "", group = "[D]ocument" },
        { "", group = "[G]it" },
        { "", desc = "<leader>d_",  hidden = true },
        { "", desc = "<leader>w_",  hidden = true },
    }, { mode = 'n' }
)
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
whichkey.add(
    {
        { "", desc = "<leader>h",        mode = "v" },
        { "", group = "visual <leader>", mode = "v" },
    }
)
