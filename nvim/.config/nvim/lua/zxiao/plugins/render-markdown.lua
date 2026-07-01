return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "markdown.mdx", "codecompanion", "Avante" },
	opts = {
		-- render only in normal mode; show raw source while editing
		render_modes = { "n", "c", "t" },
		file_types = { "markdown" },
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)

		local wk_ok, wk = pcall(require, "which-key")
		if wk_ok then
			wk.add({
				{ "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown Render" },
			})
		else
			vim.keymap.set(
				"n",
				"<leader>tm",
				"<cmd>RenderMarkdown toggle<cr>",
				{ desc = "Toggle Markdown Render" }
			)
		end
	end,
}
