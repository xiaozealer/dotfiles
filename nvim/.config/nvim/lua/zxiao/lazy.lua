local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Ghostty ships nvim ftdetect/syntax/ftplugin/compiler for its config files.
-- GHOSTTY_RESOURCES_DIR is only set when nvim runs inside Ghostty, so fall back
-- to the standard macOS app path.
local ghostty_site = vim.env.GHOSTTY_RESOURCES_DIR and (vim.env.GHOSTTY_RESOURCES_DIR .. "/../nvim/site")
	or "/Applications/Ghostty.app/Contents/Resources/nvim/site"

require("lazy").setup({ { import = "zxiao.plugins" }, { import = "zxiao.plugins.lsp" } }, {
	install = {
		colorscheme = { "catppuccin" },
	},
	-- No plugins here use luarocks; disabling avoids the `:checkhealth lazy`
	-- warnings about a missing Lua 5.1 / lua5.1 interpreter.
	rocks = {
		enabled = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	-- lazy.nvim rebuilds the runtimepath, so extra dirs must be declared here
	-- rather than appended in core/options.lua.
	performance = {
		rtp = {
			paths = vim.uv.fs_stat(ghostty_site) and { ghostty_site } or {},
		},
	},
})
