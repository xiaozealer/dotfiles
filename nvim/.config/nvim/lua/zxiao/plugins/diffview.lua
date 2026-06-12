return {
	"sindrets/diffview.nvim",
	-- Register the user-facing commands as lazy triggers so they appear in
	-- cmdline completion and load the plugin on first use. Previously diffview
	-- only loaded as a neogit dependency, so the :Diffview* commands didn't
	-- exist (and didn't complete) until Neogit had been opened.
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
		"DiffviewFileHistory",
		"DiffviewLog",
	},
}
