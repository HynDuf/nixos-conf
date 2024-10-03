local M = {}

M.ui = {
	tabufline = {
		order = { "treeOffset", "buffers", "tabs" },
	},
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
	},
}

M.base46 = {
	hl_add = require("highlights").add,
	hl_override = require("highlights").override,
	theme = "tokyodark",
	transparency = true,
}

return M
