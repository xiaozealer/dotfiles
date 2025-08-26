return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "py", "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				extraPaths = { "/Users/zxiao/src/spark-3.5.5-bin-hadoop3/python" },
			},
		},
	},
}
