local M = {}

M.override = {
	Visual = { bg = "#2a2f5c" },
	CursorLine = { bg = "#252636", fg = "#cba6f7" },
	CursorLineNr = { fg = "#7aa2f7" },
	Type = { fg = "#89b4fa", italic = true },
	Comment = { fg = "#696b87", italic = true },
	Statement = { italic = true },
	Define = { italic = true },
	SpecialComment = { italic = true },
	TSAttribute = { italic = true },
	TSFunction = { italic = true },
	TSParameter = { italic = true },
	TSLabel = { italic = true },
	TSVariableBuiltin = { italic = true },
	TSTagAttribute = { italic = true },
	["@comment"] = { fg = "#696b87", italic = true },
	-- imports
	Include = {
		italic = true,
	},
	-- for, while loops
	Repeat = {
		italic = true,
	},
	-- if statements
	Conditional = {
		italic = true,
	},
	-- class, with, as keywords
	["@keyword"] = {
		italic = true,
	},
	["@keyword.repeat"] = {
		italic = true,
	},
	["@keyword.directive.define"] = {
		italic = true,
	},
	["@keyword.conditional"] = {
		italic = true,
	},
	-- function keyword
	["@keyword.function"] = {
		italic = true,
	},
	-- return, yield keywords
	["@keyword.return"] = {
		italic = true,
	},
	["@function.call"] = {
		italic = true,
	},
	-- function parameters
	["@parameter"] = {
		italic = true,
	},

	-- markdown specific
	["@markup.italic"] = {
		italic = true,
		fg = "#85c1dc",
	},

	["@markup.strong"] = {
		bold = true,
		fg = "#c6a0f6",
	},
}

M.add = {
	["@markup.heading.1.markdown"] = {
		bold = true,
		fg = "#f38ba8",
	},
	["@markup.heading.2.markdown"] = {
		bold = true,
		fg = "#fab387",
	},
	["@markup.heading.3.markdown"] = {
		bold = true,
		fg = "#f9e2af",
	},
	["@markup.heading.4.markdown"] = {
		bold = true,
		fg = "#a6e3a1",
	},
	["@markup.heading.5.markdown"] = {
		bold = true,
		fg = "#74c7ec",
	},
	["@markup.heading.6.markdown"] = {
		bold = true,
		fg = "#b4befe",
	},
}

return M
