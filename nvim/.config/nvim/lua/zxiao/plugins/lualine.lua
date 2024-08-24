return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			-- bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local function get_venv()
			local variables = { "CONDA_DEFAULT_ENV", "VIRTUAL_ENV", "PYENV_VERSION" }
			for _, var in ipairs(variables) do
				local venv = os.getenv(var)
				if venv then
					if string.find(venv, "/") then
						for w in venv:gmatch("([^/]+)") do
							venv = w
						end
					end
					return string.format("%s", venv)
				end
			end
			return nil
		end

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				-- theme = my_lualine_theme,
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 3,
					},
				},
				lualine_x = {
					{
						-- lazy_status.updates,
						-- cond = lazy_status.has_updates,
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						get_venv,
						color = { fg = "#10ECE6A" },
					},
					-- { "encoding" },
					-- { "fileformat" },
					{ "filetype" },
				},
				lualine_z = {
					"location",
					{
						function()
							local starts = vim.fn.line("v")
							local ends = vim.fn.line(".")
							local count = starts <= ends and ends - starts + 1 or starts - ends + 1
							local wc = vim.fn.wordcount()
							return count .. ":" .. wc["visual_chars"]
						end,
						cond = function()
							return vim.fn.mode():find("[Vv]") ~= nil
						end,
					},
				},
			},
		})
	end,
}
