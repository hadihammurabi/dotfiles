function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', 'jk', '<ESC>', { silent = true })
map('i', 'kj', '<ESC>', { silent = true })

map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fl", ":Telescope lsp_document_symbols<CR>", { silent = true })
map("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })

map("n", "<leader>th", ":lua require('nvterm.terminal').toggle('horizontal')<CR>", { silent = true })
map("n", "<leader>tnh", ":lua require('nvterm.terminal').new('horizontal')<CR>", { silent = true })
map("n", "<leader>tv", ":lua require('nvterm.terminal').toggle('vertical')<CR>", { silent = true })
map("n", "<leader>tnv", ":lua require('nvterm.terminal').new('vertical')<CR>", { silent = true })

map("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { silent = true })
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { silent = true })
map("n", "<leader>dc", ":DapContinue<CR>", { silent = true })
map("n", "<leader>dt", ":DapTerminate<CR>", { silent = true })

map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-s>", ":w<CR>", { silent = true })
map("i", "<C-s>", "<esc>:w<CR>", { silent = true })
