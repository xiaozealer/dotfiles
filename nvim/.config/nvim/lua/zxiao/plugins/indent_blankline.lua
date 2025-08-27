return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		-- Define a subtle highlight (no underline or bold), adjust fg or bg if desired
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#a0a8b7", nocombine = true, bold = true }) -- adjust fg if needed

		require("ibl").setup({
			indent = {
				char = "▎",
			},

			scope = {
				enabled = true,
				show_start = false, -- No underline at scope start
				show_end = false, -- No underline at scope end
				highlight = "IblScope", -- Minimal subtle highlight (change above if desired)
				show_exact_scope = true, -- highlight follows cursor exactly
				include = {
					node_type = {
						["*"] = {
							"argument_list",
							"block",
							"class",
							"function",
							"if_statement",
							"for_statement",
							"while_statement",
							"try_statement",
							"except_clause",
							"with_statement",
						},
					},
				},
			},
		})
	end,
}
