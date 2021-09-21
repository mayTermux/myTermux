-- settings

local cmd = vim.cmd

-- Return to last edit line position when opening files
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]];

-- Set nowrap text when opening files
cmd [[set nowrap]];

-- Set Cursor Underline
cmd [[set guicursor=]];

-- Restore Cursor
cmd [[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20
  augroup END
]];

-- mapping

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Terminal

-- <C-l> == CTRL + l
map("n", "<C-r>", ":vnew +terminal | setlocal nobuflisted <CR>", opt) -- term over right
-- <C-x> == CTRL + x
map("n", "<C-x>", ":10new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
-- <M-t> == ALT + t
map("n", "<M-t>", ":terminal <CR>", opt) -- term buffer

-- Number Line
-- <C-m> == CTRL + m
map("n", "<C-m>", ":set number <CR>", opt) -- set number
-- <C-M-m> == CTRL + ALT + m
map("n", "<C-M-m>", ":set nonumber <CR>", opt) -- set nonumber

-- Wrap Text 
-- <C-w> == CTRL + w
map("n", "<C-w>", [[<esc>:set wrap<cr>]], opt)
map("i", "<C-w>", [[<esc>:set wrap<cr>]], opt)
map("v", "<C-w>", [[<esc>:set wrap<cr>]], opt)

-- No Wrap Text 
-- <C-M-w> == CTRL + ALT + w
map("n", "<C-M-w>", [[<esc>:set nowrap<cr>]], opt)
map("i", "<C-M-w>", [[<esc>:set nowrap<cr>]], opt)
map("v", "<C-M-w>", [[<esc>:set nowrap<cr>]], opt)

-- save on normal, insert and visual mode (CTRL + S)
map("n", "<C-s>", [[<esc>:w<cr>]], opt)
map("i", "<C-s>", [[<esc>:w<cr>]], opt)
map("v", "<C-s>", [[<esc>:w<cr>]], opt)

-- quit on normal, insert and visual mode (CTRL + Q)
map("n", "<C-q>", [[<esc>:q<cr>]], opt)
map("i", "<C-q>", [[<esc>:q<cr>]], opt)
map("v", "<C-q>", [[<esc>:q<cr>]], opt)

-- save and quit, insert and visual mode (CTRL + ALT + S)
map("n", "<C-M-s>", [[<esc>:wq!<cr>]], opt)
map("i", "<C-M-s>", [[<esc>:wq!<cr>]], opt)
map("v", "<C-M-s>", [[<esc>:wq!<cr>]], opt)

-- quit without save on normal, insert and visual mode (CTRL + ALT + Q)
map("n", "<C-M-q>", [[<esc>:q!<cr>]], opt)
map("i", "<C-M-q>", [[<esc>:q!<cr>]], opt)
map("v", "<C-M-q>", [[<esc>:q!<cr>]], opt)

-- move cursor to start (home) text on normal, insert and visual mode. Example: n... (CTRL + A) 
map("n", "<C-a>", [[<home>]], opt)
map("i", "<C-a>", [[<home>]], opt)
map("v", "<C-a>", [[<home>]], opt)

-- move cursor to end text on normal, insert and visual mode. Example: n... (CTRL + D) 
map("n", "<C-d>", [[<end>]], opt)
map("i", "<C-d>", [[<end>]], opt)
map("v", "<C-d>", [[<end>]], opt)

