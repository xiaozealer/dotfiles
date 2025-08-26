return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})

					local extends = {
						typescript = { "tsdoc" },
						javascript = { "jsdoc" },
						lua = { "luadoc" },
						python = { "pydoc" },
						rust = { "rustdoc" },
						cs = { "csharpdoc" },
						java = { "javadoc" },
						c = { "cdoc" },
						cpp = { "cppdoc" },
						php = { "phpdoc" },
						kotlin = { "kdoc" },
						ruby = { "rdoc" },
						sh = { "shelldoc" },
					}
					-- friendly-snippets - enable standardized comments snippets
					for ft, snips in pairs(extends) do
						require("luasnip").filetype_extend(ft, snips)
					end
				end,
			},
		},
	},
	version = "*",
	config = function()
		require("blink.cmp").setup({
			snippets = { preset = "luasnip" },
			signature = { enabled = true },
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "normal",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					cmdline = {
						min_keyword_length = 2,
					},
				},
			},
			keymap = {
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
			},
			cmdline = {
				enabled = false,
				completion = { menu = { auto_show = true } },
				keymap = {
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
			},
			completion = {
				accept = {
					auto_brackets = { enabled = true },
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				menu = {
					border = nil,
					scrolloff = 1,
					scrollbar = false,
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
				documentation = {
					window = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						scrollbar = false,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
		})

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
