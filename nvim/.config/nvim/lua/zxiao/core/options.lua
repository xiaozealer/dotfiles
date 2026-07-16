local opt = vim.opt

-- Disable optional remote-host providers we don't use. Keeps `:checkhealth`
-- clean instead of warning about missing perl/ruby/python3/node `neovim` packages.
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- gopls advertises the `gotmpl` filetype; register it so `:checkhealth vim.lsp`
-- doesn't warn about an unknown filetype (also attaches gopls to Go templates).
vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		tmpl = "gotmpl",
	},
})

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

vim.lsp.log.set_level("off")
-- blinking cursor
-- " enable vertical cursor when in insert mode
-- opt.guicursor = "n-v-c-s:block,i:block-blinkwait100-blinkoff500-blinkon500"
-- opt.guicursor = opt.guicursor .. ",i:block-blinkwait100-blinkoff500-blinkon500"
