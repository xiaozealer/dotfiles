return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- transparent_background = true,
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			integrations = {
				barbar = true,
				noice = true,
				which_key = true,
			},
		})
		-- vim.cmd.colorscheme("catppuccin-frappe")
		vim.cmd.colorscheme("catppuccin")
	end,
}
