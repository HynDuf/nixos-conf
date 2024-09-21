local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		markdown = { "prettierd" },

		sh = { "shfmt" },
		zig = { "zigfmt" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		nix = { "nixfmt" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_fix", "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		tex = { "latexindent" },
		sv = { "verible" },
	},
	ft_parsers = {
		--     javascript = "babel",
		--     javascriptreact = "babel",
		--     typescript = "typescript",
		--     typescriptreact = "typescript",
		--     vue = "vue",
		--     css = "css",
		--     scss = "scss",
		--     less = "less",
		--     html = "html",
		--     json = "json",
		--     jsonc = "json",
		--     yaml = "yaml",
		markdown = "goldmark",
		-- ['markdown.mdx'] = 'mdx',
		--     graphql = "graphql",
		--     handlebars = "glimmer",
	},

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },

	notify_on_error = true,
}

require("conform").setup(options)
