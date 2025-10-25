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

-- Sync Telescope hidden-search with nvim-tree’s H toggle
M.nvimtree.on_attach = function(bufnr)
  local api = require("nvim-tree.api")

  -- keep default nvim-tree mappings first
  if api.config and api.config.mappings and api.config.mappings.default_on_attach then
    api.config.mappings.default_on_attach(bufnr)
  end

  -- seed the flag exactly once from your configured default
  if vim.g.nvim_tree_show_dotfiles == nil then
    local show = M.nvimtree and M.nvimtree.filters and (M.nvimtree.filters.dotfiles == false)
    vim.g.nvim_tree_show_dotfiles = show and 1 or 0
  end

  -- override H inside the tree buffer to also flip our flag
  local function map(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end

  map("H", function()
    -- official toggle for dotfiles/hidden
    if type(api.tree.toggle_hidden_filter) == "function" then
      api.tree.toggle_hidden_filter()
    else
      -- (very old versions) try fallbacks
      pcall(api.tree.toggle_gitignore_filter)
      pcall(api.tree.toggle_custom_filter)
    end

    -- mirror state for Telescope
    vim.g.nvim_tree_show_dotfiles = (vim.g.nvim_tree_show_dotfiles == 1) and 0 or 1
    -- optional: quick feedback while debugging
    -- vim.notify("dotfiles=" .. vim.g.nvim_tree_show_dotfiles)
  end, "Toggle dotfiles + sync Telescope")
end

return M
