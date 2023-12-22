vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "_", "<C-w>v") -- split window vertically
keymap.set("n", "-", "<C-w>s") -- split window horizontally
keymap.set("n", "<C-w>x", ":close<CR>") -- close current split window

-- tab control
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<Tab>", ":tabn<CR>")
keymap.set("n", "<S-Tab>", ":tabp<CR>")

-- vim-maximizer
keymap.set("n", "<C-w>z", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- lazy
keymap.set("n", "<leader>la", ":Lazy<CR>")
