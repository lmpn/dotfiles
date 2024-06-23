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

local bmap = vim.api.nvim_set_keymap
local kmap = vim.keymap.set

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
kmap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
kmap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- move selected line up/down
kmap("v", "J", ":m '>+1<CR>gv=gv")
kmap("v", "K", ":m '<-2<CR>gv=gv")
-- cursor stays in place after J
kmap("n", "J", "mzJ`z")
-- jump to next/previous result and make it in the middle of the screen
kmap("n", "n", "nzzzv")
kmap("n", "N", "Nzzzv")
-- pasting on top doesn't clear p's value
kmap("x", "<leader>p", [["_dP]])


-- [[ Combo Keymaps]]
-- find all and replace
kmap("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[F]indall and [R]eplace' })
-- Diagnostic keymaps
kmap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
kmap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
kmap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
kmap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
kmap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
kmap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
kmap('n', '<leader>/', telescope_current_buffer_fzf, { desc = '[/] Fuzzily search in current buffer' })
kmap('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
kmap('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
kmap('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
kmap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
kmap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
kmap('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
kmap('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
kmap('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
kmap('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
kmap('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
kmap("n", "<leader>f", vim.lsp.buf.format, { desc = '[F]ormat file' })
bmap('n', '<A-,>', '<cmd>BufferPrevious<CR>', { desc = 'Previous buffer', noremap = true, silent = true })
bmap('n', '<A-.>', '<cmd>BufferNext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
bmap('n', '<A-<>', '<cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Buffer move previous' })
bmap('n', '<A->>', '<cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Buffer move next' })
bmap('n', '<A-1>', '<cmd>BufferGoto 1<CR>', { noremap = true, silent = true, desc = 'Buffer goto 1' })
bmap('n', '<A-2>', '<cmd>BufferGoto 2<CR>', { noremap = true, silent = true, desc = 'Buffer goto 2' })
bmap('n', '<A-3>', '<cmd>BufferGoto 3<CR>', { noremap = true, silent = true, desc = 'Buffer goto 3' })
bmap('n', '<A-4>', '<cmd>BufferGoto 4<CR>', { noremap = true, silent = true, desc = 'Buffer goto 4' })
bmap('n', '<A-5>', '<cmd>BufferGoto 5<CR>', { noremap = true, silent = true, desc = 'Buffer goto 5' })
bmap('n', '<A-6>', '<cmd>BufferGoto 6<CR>', { noremap = true, silent = true, desc = 'Buffer goto 6' })
bmap('n', '<A-7>', '<cmd>BufferGoto 7<CR>', { noremap = true, silent = true, desc = 'Buffer goto 7' })
bmap('n', '<A-8>', '<cmd>BufferGoto 8<CR>', { noremap = true, silent = true, desc = 'Buffer goto 8' })
bmap('n', '<A-9>', '<cmd>BufferGoto 9<CR>', { noremap = true, silent = true, desc = 'Buffer goto 9' })
bmap('n', '<A-0>', '<cmd>BufferLast<CR>', { noremap = true, silent = true, desc = 'Last buffer' })
bmap('n', '<A-p>', '<cmd>BufferPin<CR>', { noremap = true, silent = true, desc = 'Pin buffer' })
bmap('n', '<A-c>', '<cmd>BufferClose<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
bmap('n', '<C-p>', '<cmd>BufferPick<CR>', { noremap = true, silent = true, desc = 'Pick buffer' })
bmap('n', '<Space>bb', '<cmd>BufferOrderByBufferNumber<CR>',
  { noremap = true, silent = true, desc = 'Order buffer by number' })
bmap('n', '<Space>bd', '<cmd>BufferOrderByDirectory<CR>',
  { noremap = true, silent = true, desc = 'Order buffer by directory' })
bmap('n', '<Space>bl', '<cmd>BufferOrderByLanguage<CR>',
  { noremap = true, silent = true, desc = 'Order buffers by language' })
bmap('n', '<Space>bw', '<cmd>BufferOrderByWindowNumber<CR>',
  { desc = 'Sort by window number', noremap = true, silent = true })
bmap('n', '<leader>cg', '<cmd>Gen<cr>', { noremap = true, silent = true, desc = "LLM tools" })
bmap('v', '<leader>cg', '<cmd>Gen<cr>', { noremap = true, silent = true, desc = "LLM tools" })
