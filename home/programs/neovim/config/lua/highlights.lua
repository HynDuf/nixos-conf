return {
	Visual = { bg = "#2a2f5c" },
	CursorLine = { bg = "#252636", fg = "#cba6f7" },
	CursorLineNr = { fg = "#7aa2f7" },
	Search = { bg = "#cba6f7" },
	Type = { fg = "#89b4fa", italic = true },
	Comment = { italic = true },
	Statement = { italic = true },
	Define = { italic = true },
	SpecialComment = { italic = true },
	TSAttribute = { italic = true },
	TSFunction = { italic = true },
	TSParameter = { italic = true },
	TSLabel = { italic = true },
	TSVariableBuiltin = { italic = true },
	TSTagAttribute = { italic = true },
	["@comment"] = { italic = true },
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
	-- symbolic
	["@operator"] = {
		italic = true,
	},
	-- logical keywords
	["@keyword.operator"] = {
		italic = true,
	},
	-- function parameters
	["@parameter"] = {
		italic = true,
	},
}
