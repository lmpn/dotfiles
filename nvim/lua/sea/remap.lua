local function telescope_current_buffer_fzf()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

local function current_file()
  local current_file = vim.api.nvim_buf_get_name(0)
  return current_file
end

local barbar_map = vim.api.nvim_set_keymap
local key_map = vim.keymap.set

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
key_map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
key_map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key_map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- move selected line up/down
key_map("v", "J", ":m '>+1<CR>gv=gv")
key_map("v", "K", ":m '<-2<CR>gv=gv")
-- cursor stays in place after J
key_map("n", "J", "mzJ`z")
-- jump to next/previous result and make it in the middle of the screen
key_map("n", "n", "nzzzv")
key_map("n", "N", "Nzzzv")
-- pasting on top doesn't clear p's value
key_map("x", "<leader>p", [["_dP]])


-- [[ Combo Keymaps]]
-- find all and replace
key_map("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[F]indall and [R]eplace' })
-- Diagnostic keymaps
key_map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
key_map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
key_map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
key_map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
key_map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
key_map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
key_map('n', '<leader>/', telescope_current_buffer_fzf, { desc = '[/] Fuzzily search in current buffer' })
key_map('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
key_map('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
key_map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
key_map('n', "<leader>gd", function()
    vim.cmd("Git log -p " .. current_file())
    vim.cmd.normal("<C-w>l")
  end,
  { desc = "[G]it view last change" })
key_map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
key_map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
key_map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
key_map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
key_map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
key_map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
key_map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
key_map("n", "<leader>f", vim.lsp.buf.format, { desc = '[F]ormat file' })
key_map('n', "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
key_map('n', "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)", })
key_map('n', "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)", })
key_map('n', "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)", })
key_map('n', "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
key_map('n', "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
barbar_map('n', '<A-,>', '<cmd>BufferPrevious<CR>', { desc = 'Previous buffer', noremap = true, silent = true })
barbar_map('n', '<A-.>', '<cmd>BufferNext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
barbar_map('n', '<A-<>', '<cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Buffer move previous' })
barbar_map('n', '<A->>', '<cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Buffer move next' })
barbar_map('n', '<A-1>', '<cmd>BufferGoto 1<CR>', { noremap = true, silent = true, desc = 'Buffer goto 1' })
barbar_map('n', '<A-2>', '<cmd>BufferGoto 2<CR>', { noremap = true, silent = true, desc = 'Buffer goto 2' })
barbar_map('n', '<A-3>', '<cmd>BufferGoto 3<CR>', { noremap = true, silent = true, desc = 'Buffer goto 3' })
barbar_map('n', '<A-4>', '<cmd>BufferGoto 4<CR>', { noremap = true, silent = true, desc = 'Buffer goto 4' })
barbar_map('n', '<A-5>', '<cmd>BufferGoto 5<CR>', { noremap = true, silent = true, desc = 'Buffer goto 5' })
barbar_map('n', '<A-6>', '<cmd>BufferGoto 6<CR>', { noremap = true, silent = true, desc = 'Buffer goto 6' })
barbar_map('n', '<A-7>', '<cmd>BufferGoto 7<CR>', { noremap = true, silent = true, desc = 'Buffer goto 7' })
barbar_map('n', '<A-8>', '<cmd>BufferGoto 8<CR>', { noremap = true, silent = true, desc = 'Buffer goto 8' })
barbar_map('n', '<A-9>', '<cmd>BufferGoto 9<CR>', { noremap = true, silent = true, desc = 'Buffer goto 9' })
barbar_map('n', '<A-0>', '<cmd>BufferLast<CR>', { noremap = true, silent = true, desc = 'Last buffer' })
barbar_map('n', '<A-p>', '<cmd>BufferPin<CR>', { noremap = true, silent = true, desc = 'Pin buffer' })
barbar_map('n', '<A-c>', '<cmd>BufferClose<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
barbar_map('n', '<C-p>', '<cmd>BufferPick<CR>', { noremap = true, silent = true, desc = 'Pick buffer' })
barbar_map('n', '<Space>bb', '<cmd>BufferOrderByBufferNumber<CR>',
  { noremap = true, silent = true, desc = 'Order buffer by number' })
barbar_map('n', '<Space>bd', '<cmd>BufferOrderByDirectory<CR>',
  { noremap = true, silent = true, desc = 'Order buffer by directory' })
barbar_map('n', '<Space>bl', '<cmd>BufferOrderByLanguage<CR>',
  { noremap = true, silent = true, desc = 'Order buffers by language' })
barbar_map('n', '<Space>bw', '<cmd>BufferOrderByWindowNumber<CR>',
  { desc = 'Sort by window number', noremap = true, silent = true })
barbar_map('n', '<leader>cg', '<cmd>Gen<cr>', { noremap = true, silent = true, desc = "LLM tools" })
barbar_map('v', '<leader>cg', '<cmd>Gen<cr>', { noremap = true, silent = true, desc = "LLM tools" })
