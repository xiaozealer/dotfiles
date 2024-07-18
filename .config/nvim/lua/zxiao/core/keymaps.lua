vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "_", "<C-w>v") -- split window vertically
keymap.set("n", "-", "<C-w>s") -- split window horizontally
keymap.set("n", "<C-w>x", ":close<CR>") -- close current split window

-- tab control
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
-- keymap.set("n", "<Tab>", ":tabn<CR>")
-- barbar
keymap.set("n", "<Tab>", ":BufferNext<CR>")
keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>")
keymap.set("n", "<C-c>", ":BufferClose<CR>")

-- vim-maximizer
keymap.set("n", "<C-w>z", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>")
keymap.set("n", "<leader>c", ":NvimTreeToggle<CR>")

-- lazy
keymap.set("n", "<leader>la", ":Lazy<CR>")

-- nvim treesitter context
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
