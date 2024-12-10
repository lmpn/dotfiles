-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Remap for dealing with word wrap
local key_map = vim.keymap.set
key_map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key_map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- move selected line up/down
key_map("v", "J", ":m '>+1<CR>gv=gv")
key_map("v", "K", ":m '<-2<CR>gv=gv")
-- cursor stays in place after J
key_map("n", "J", "mzJ`z")
-- jump to next/previous result and make it in the middle of the screen
key_map("n", "n", "nzzzv")
key_map("n", "N", "Nzzzv")
