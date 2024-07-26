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
keymap.set("n", "<leader>x", ":NvimTreeToggle<CR>")

-- lazy
keymap.set("n", "<leader>la", ":Lazy<CR>")

-- nvim treesitter context
-- vim.keymap.set("n", "[c", function()
-- 	require("treesitter-context").go_to_context(vim.v.count1)
-- end, { silent = true })

-- barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
