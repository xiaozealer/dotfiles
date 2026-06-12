return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
	root_markers = { "go.mod", "go.work", ".git" },
	settings = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = false,
				compositeLiteralFields = false,
				compositeLiteralTypes = false,
				constantValues = false,
				functionTypeParameters = false,
				parameterNames = false,
				rangeVariableTypes = false,
			},
			analyses = {
				-- Only meaningful overrides are listed; gopls applies sensible
				-- defaults for everything else. (The previous huge list of
				-- `= false` entries included invalid analyzer names like `deba`,
				-- which gopls warns about on startup.)

				-- Enabled: catch common issues
				nilness = true, -- nil pointer dereferences
				unusedparams = true, -- unused function parameters
				unusedwrite = true, -- unused writes to variables
				useany = true, -- suggest 'any' over 'interface{}'
				unreachable = true, -- unreachable code
				unusedresult = true, -- unused results of certain calls
				simplifyslice = true, -- simplify slice expressions
				simplifyrange = true, -- simplify range loops
				simplifycompositelit = true, -- simplify composite literals

				-- Disabled: too slow / noisy on large codebases
				shadow = false,
				printf = false,
				structtag = false,
				fieldalignment = false,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			semanticTokens = false,
		},
	},
	-- capabilities = vim.tbl_deep_extend(
	--     "force",
	--     {},
	--     vim.lsp.protocol.make_client_capabilities(),
	--     blink.get_lsp_capabilities(),
	--     {
	--         fileOperations = {
	--             didRename = true,
	--             willRename = true,
	--         },
	--     }
	-- ),
}
