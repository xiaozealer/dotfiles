return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	config = function()
		-- import nvim-autopairs
		local autopairs = require("nvim-autopairs")

		-- configure autopairs
		autopairs.setup({
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				python = { "string" }, -- don't add pairs in lua string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		})
		-- NOTE: the old nvim-cmp confirm_done integration was removed. This
		-- config uses blink.cmp, which doesn't emit nvim-cmp events, so the
		-- integration never ran. blink has its own auto-bracket handling.
	end,
}
