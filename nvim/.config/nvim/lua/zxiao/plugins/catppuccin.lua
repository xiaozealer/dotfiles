return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			transparent_background = true,
			integrations = {
				barbar = true,
				noice = true,
				which_key = true,
				gitsigns = true,
				treesitter = true,
				native_lsp = { enabled = true },
				blink_cmp = true,
				flash = true,
				snacks = true,
				mini = { enabled = true },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
