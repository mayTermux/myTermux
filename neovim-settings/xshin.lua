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

-- save on normal, insert and visual mode (CTRL + S)
map("n", "<C-s>", [[<esc>:w<cr>]], opt)
map("i", "<C-s>", [[<esc>:w<cr>]], opt)
map("v", "<C-s>", [[<esc>:w<cr>]], opt)

-- quit on normal, insert and visual mode (CTRL + Q)
map("n", "<C-q>", [[<esc>:q<cr>]], opt)
map("i", "<C-q>", [[<esc>:q<cr>]], opt)
map("v", "<C-q>", [[<esc>:q<cr>]], opt)

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

