local opt = vim.opt

-- line numbers
opt.number = true
-- tabs and & indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursorline
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- turn off swapfile
opt.swapfile = false

-- for disable mode in lualine
opt.showmode = false
-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- blinking cursor
-- " enable vertical cursor when in insert mode
-- opt.guicursor = "n-v-c-s:block,i:block-blinkwait100-blinkoff500-blinkon500"
-- opt.guicursor = opt.guicursor .. ",i:block-blinkwait100-blinkoff500-blinkon500"
