local M = {}

M.ui = {
	hl_override = require("highlights").override,
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
