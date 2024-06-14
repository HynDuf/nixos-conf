local M = {}

M.ui = {
	hl_override = {
		Visual = { bg = "#43364a" },
		CursorLine = { bg = "#252636", fg = "#cba6f7" },
		CursorLineNr = { fg = "#7aa2f7" },

		-- alpha-nvim "neovim" color
		Type = { fg = "#89b4fa" },
	},
	theme = "catppuccin",
	transparency = true,
	tabufline = {
		order = { "treeOffset", "buffers", "tabs" },
	},
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
	},
}

return M
