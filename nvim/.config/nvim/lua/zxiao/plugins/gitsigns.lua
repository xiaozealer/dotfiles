return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, desc, opts)
					opts = opts or {}
					opts.buffer = bufnr
					opts.desc = desc
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, "stage_hunk")
				map("n", "<leader>hr", gitsigns.reset_hunk, "reset_hunk")
				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "stage_hunk_line")
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "reset_hunk_line")
				map("n", "<leader>hS", gitsigns.stage_buffer, "stage_buffer")
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, "undo_stage_hunk")
				map("n", "<leader>hR", gitsigns.reset_buffer, "reset_buffer")
				map("n", "<leader>hp", gitsigns.preview_hunk, "preview_hunk")
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "blame_current_line")
				map("n", "<leader>hd", gitsigns.diffthis, "diff")
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, "Diff this ~")
				map("n", "<leader>td", gitsigns.toggle_deleted, "deleted")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
		vim.cmd("set statusline+=%{get(b:,'gitsigns_status','')} ")
	end,
}
