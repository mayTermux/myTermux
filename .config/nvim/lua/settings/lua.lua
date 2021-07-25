local cmd = vim.cmd

-- Return to last edit position when opening files
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]];

-- Set underline cursor
cmd [[set cursorline]];

cmd [[set nowrap]];
