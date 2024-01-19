local function nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- local function opts(desc)
  --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>',      api.tree.change_root_to_parent, opts('Up'))
  -- vim.keymap.set('n', '?',          api.tree.toggle_help,           opts('Help'))
  vim.keymap.set('n', '<leader>pv', api.tree.open)
  vim.keymap.set('n', '<leader>pq', api.tree.close)
end

require("nvim-tree").setup({
  on_attach = nvim_tree_on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
