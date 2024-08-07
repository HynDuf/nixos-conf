local M = {}

M.ui = {
	hl_override = {
		Visual = { bg = "#2a2f5c" },
		CursorLine = { bg = "#252636", fg = "#cba6f7" },
		CursorLineNr = { fg = "#7aa2f7" },
		Search = { bg = "#cba6f7" },
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
