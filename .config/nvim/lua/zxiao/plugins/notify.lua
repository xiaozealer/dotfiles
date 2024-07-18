return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			fps = 60,
			render = "compact",
		})
	end,
}
