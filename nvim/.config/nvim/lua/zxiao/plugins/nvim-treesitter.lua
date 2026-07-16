-- nvim-treesitter `main` branch (the rewrite). The old `master` branch is
-- frozen and crashes on Neovim 0.12 (query directive matches now return node
-- lists, breaking master's predicates). `main` targets 0.11+/0.12.
--
-- On `main` the plugin only manages parser installation + a few helpers;
-- highlighting is enabled via `vim.treesitter.start()` (see core/autocmds.lua)
-- and indentation via `indentexpr` (also set there).
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({})

			-- Parsers we want available. `ensure_installed` no longer exists on
			-- `main`; install the missing ones ourselves (diff-checked so we don't
			-- reinstall on every startup).
			local ensure_installed = {
				"json",
				"yaml",
				"python",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"regex",
				"dockerfile",
				"gitignore",
				"go",
			}
			local installed = require("nvim-treesitter.config").get_installed("parsers")
			local to_install = vim.tbl_filter(function(parser)
				return not vim.tbl_contains(installed, parser)
			end, ensure_installed)
			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end

			-- Incremental selection: `main` dropped the built-in module, so this is
			-- a small standalone reimplementation.
			--   <C-space> (normal)  start selection at the node under the cursor
			--   <C-space> (visual)  grow selection to the parent node
			--   <bs>      (visual)  shrink selection to the previous node
			local sel_stack = {}

			local function select_node(node)
				if not node then
					return
				end
				local srow, scol, erow, ecol = node:range()
				vim.fn.setpos("'<", { 0, srow + 1, scol + 1, 0 })
				if ecol == 0 then
					-- range end is exclusive at column 0 => ends on previous line
					erow = erow - 1
					local line = vim.api.nvim_buf_get_lines(0, erow, erow + 1, false)[1] or ""
					ecol = math.max(#line, 1)
				end
				vim.fn.setpos("'>", { 0, erow + 1, ecol, 0 })
				vim.cmd("normal! gv")
			end

			vim.keymap.set("n", "<C-space>", function()
				local node = vim.treesitter.get_node()
				sel_stack = node and { node } or {}
				select_node(node)
			end, { desc = "TS: init selection" })

			vim.keymap.set("x", "<C-space>", function()
				local top = sel_stack[#sel_stack] or vim.treesitter.get_node()
				local parent = top and top:parent()
				if parent then
					table.insert(sel_stack, parent)
					select_node(parent)
				else
					select_node(top)
				end
			end, { desc = "TS: grow selection" })

			vim.keymap.set("x", "<bs>", function()
				if #sel_stack > 1 then
					table.remove(sel_stack)
				end
				select_node(sel_stack[#sel_stack])
			end, { desc = "TS: shrink selection" })
		end,
	},
}
