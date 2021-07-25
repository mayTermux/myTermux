local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- copy any selected text with pressing y
map("", "<leader>c", '"+y')

-- OPEN TERMINALS --
map("n", "<C-l>", [[<Cmd>vnew term://zsh <CR>]], opt) -- open term over right
map("n", "<C-x>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) -- open term bottom

-- COPY EVERYTHING --
map("n", "<C-M-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis mode
map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)

-- save
map("n", "<C-s>", [[<esc>:w<cr>]], opt)
map("v", "<C-s>", [[<esc>:w<cr>]], opt)
map("i", "<C-s>", [[<esc>:w<cr>]], opt)

-- quit
map("n", "<C-q>", [[<esc>:q<cr>]], opt)
map("v", "<C-q>", [[<esc>:q<cr>]], opt)
map("i", "<C-q>", [[<esc>:q<cr>]], opt)

-- quit without saving
map("n", "<C-M-q>", [[<esc>:q!<cr>]], opt)
map("v", "<C-M-q>", [[<esc>:q!<cr>]], opt)
map("i", "<C-M-q>", [[<esc>:q!<cr>]], opt)

-- home text
map("n", "<C-a>", [[<home>]], opt)
map("i", "<C-a>", [[<home>]], opt)
map("c", "<C-a>", [[<home>]], opt)

-- end text
map("n", "<C-d>", [[<end>]], opt)
map("i", "<C-d>", [[<end>]], opt)
map("c", "<C-d>", [[<end>]], opt)

-- wrap text

