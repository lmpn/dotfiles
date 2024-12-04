local keymaps = require("core.keymaps") -- keymap reference
require("core.options")                 -- load neovim settings
require("core.lazy")                    -- load lazy nvim plugin manager
require("core.theme")                   -- load color theme settings
keymaps.init()                          -- initialize and load general keymaps
keymaps.plugins()                       -- load plugin specific keymaps, dependes on core.lazy due to telescope
require("core.autocmds")                -- load autocmds
