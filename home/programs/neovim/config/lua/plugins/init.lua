local overrides = require("configs.overrides")

return {
	-- --------------------
	-- disabled plugins (in nvchad)
	-- --------------------
	{
		"williamboman/mason.nvim",
		enabled = false,
	},

	-- --------------------
	-- ui stuff
	-- --------------------

	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},

	-- --------------------
	-- motions
	-- --------------------
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			-- require('leap').create_default_mappings()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
			require("leap").opts.equivalence_classes = {
				" \t\r\n",
				"aäàáâãāăạảãắằẳẵặấầẩẫậ",
				"dḍđ",
				"eëéèêēẹẻẽếềểễệ",
				"gǧğ",
				"hḥḫ",
				"iïīíìîıỉĩị",
				"nñ",
				"oọóòỏõōôốồộổỗơởỡớờợ",
				"sṣšß",
				"tṭ",
				"uúûüűùủũụưựứừửữ",
				"zẓ",
			}
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {},
	},

	{
		"cbochs/portal.nvim",
		event = "VeryLazy",
	},

	-- --------------------
	-- obsidian stuff
	-- --------------------
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		event = "VeryLazy",
		ft = "markdown",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "Life",
					path = "~/Documents/Obsidian/Life",
				},
			},
			disable_frontmatter = true,
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({ keymaps = { visual = "ms", visual_line = "mS" } })
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"chomosuke/typst-preview.nvim",
		dev = false,
		ft = "typst",
		opts = {
			dependencies_bin = {
				["typst-preview"] = "tinymist",
				["websocat"] = "websocat",
			},
		},
	},

	-- --------------------
	-- default stuff
	-- --------------------
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").setup()
			require("telescope").load_extension("fzf")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = {
			"NvimTreeFocus",
		},
		opts = overrides.nvimtree,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	-- {
	--   'rcarriga/nvim-dap-ui',
	--   dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
	-- },
	-- {
	--   'mfussenegger/nvim-dap',
	--   opts = {},
	-- },

	-- --------------------
	-- typesetting
	-- --------------------
	--
	-- {
	--   'chomosuke/typst-preview.nvim',
	--   ft = 'typst',
	--   version = '0.3.*',
	--   build = function()
	--     require('typst-preview').update()
	--   end,
	-- },

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI", enable_autosnippets = true },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("nvchad.configs.luasnip")
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}
