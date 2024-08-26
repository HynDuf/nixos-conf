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
		"arduino",
		-- mrk
		"markdown",
		"markdown_inline",
		"latex",
		"python",
    "go",
    "rust",
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
