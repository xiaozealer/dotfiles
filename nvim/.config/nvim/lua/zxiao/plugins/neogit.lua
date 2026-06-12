return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({
			-- Use the already-loaded snacks picker instead of telescope, so
			-- opening Neogit doesn't have to lazy-load the whole telescope
			-- plugin (+ fzf-native) on first use.
			integrations = {
				snacks = true,
				telescope = false,
				fzf_lua = false,
				mini_pick = false,
				diffview = true,
			},
		})
	end,
	keys = {
		{ "<leader>lg", "<cmd>Neogit<cr>", desc = "Neogit" },
	},
}
