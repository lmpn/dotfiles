--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]

require('sea.set')
require('sea.lazy-plugins')
require('sea.yank_hl')
require('sea.telescope')
require('sea.treesitter')
require('sea.mason')
require('sea.cmp')
require('sea.remap')
require('sea.theme')
require('sea.llm')
require('sea.go')
require('sea.go-dap')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- document existing key chains
local wk = require('which-key')
wk.add(
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
wk.add(
  {
    { "", desc = "<leader>h",        mode = "v" },
    { "", group = "visual <leader>", mode = "v" },
  }
)
