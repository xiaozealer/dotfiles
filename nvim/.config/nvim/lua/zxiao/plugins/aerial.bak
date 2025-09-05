return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			attach_mode = "global",
			backends = { "lsp", "treesitter", "markdown", "man" },
			show_guides = true,
			layout = {
				resize_to_content = true,
				win_opts = {
					winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
					signcolumn = "yes",
					statuscolumn = " ",
				},
				default_direction = "prefer_left",
			},
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")
	end,
}
