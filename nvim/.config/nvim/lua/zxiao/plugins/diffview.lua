return {
	-- Actively maintained fork of sindrets/diffview.nvim. Drop-in: same
	-- `diffview` Lua module and `:Diffview*` commands, so Neogit's diffview
	-- integration and the triggers below keep working unchanged.
	"dlyongemallo/diffview-plus.nvim",
	version = "*", -- track stable tagged releases
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
