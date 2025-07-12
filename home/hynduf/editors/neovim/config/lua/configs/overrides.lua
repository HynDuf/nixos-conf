local M = {}

M.treesitter = {
	ensure_installed = {
		-- vim stuff
		"vim",
		"vimdoc",
		"lua",
		-- web dev
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"csv",
		"astro",
		"svelte",
		"dockerfile",
    "sql",
		-- utils
		"fish",
		"gitignore",
		"nix",
		"just",
		"make",
		"verilog",
		"toml",
		"yaml",
		"kdl",
		-- lll
		"cpp",
		"c",
		"zig",
    "rust",
		"arduino",
		-- mrk
		"markdown",
		"markdown_inline",
		"latex",
    "typst",
		"python",
    "go",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
}

M.nvimtree = {
	git = {
		enable = true,
		ignore = false,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},

	filters = {
		dotfiles = true,
	},
}

return M
