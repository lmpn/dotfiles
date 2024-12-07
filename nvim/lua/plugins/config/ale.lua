local g = vim.g

-- g.ale_ruby_rubocop_auto_correct_all = 1

g.ale_linters = {
    go = { 'golangci-lint' },
    rust = { 'rust-analyzer' },
    html = {}
}

g.ale_fixers = { html = { 'prettier' } }
