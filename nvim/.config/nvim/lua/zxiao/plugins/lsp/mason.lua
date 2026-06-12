return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>ma", "<cmd>Mason<CR>")

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"pyright",
				"gopls",
			},
			-- Servers are enabled explicitly via vim.lsp.enable() in
			-- core/lsp.lua, so don't let mason-lspconfig auto-enable them too
			-- (avoids double-enabling). automatic_installation was a v1 option
			-- and is a no-op in mason-lspconfig v2; ensure_installed handles it.
			automatic_enable = false,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				-- ruff (python formatter/import sorting) is installed via brew, not Mason:
				-- Mason installs ruff through pip, which is pinned to Nextdoor's private
				-- CodeArtifact index and can't fetch it. conform finds the brew binary on PATH.
				"prettier", -- json/markdown formatter
			},
		})
	end,
}
