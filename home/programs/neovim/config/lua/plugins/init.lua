local overrides = require("configs.overrides")

return {

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
	{
		"rcarriga/nvim-notify",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- --------------------
	-- motions
	-- --------------------
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		lazy = false,
		config = function()
			-- require('leap').create_default_mappings()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
			require("leap").opts.equivalence_classes = {
				" \t\r\n",
				"aäàáâãā",
				"dḍ",
				"eëéèêē",
				"gǧğ",
				"hḥḫ",
				"iïīíìîı",
				"nñ",
				"oō",
				"sṣšß",
				"tṭ",
				"uúûüűū",
				"zẓ",
			}
		end,
	},

	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
		keys = overrides.harpoon_keys,
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

	{
		"L3MON4D3/LuaSnip",
		opts = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			-- store_selection_keys = "<Tab>",
		},
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
	-- tryin stuff
	-- --------------------
	-- {
	--   'stevearc/overseer.nvim',
	--   opts = {},
	-- },
	{
		"coffebar/neovim-project",
		opts = overrides.nvimproject,
		-- init = function()
		-- enable saving the state of plugins in the session
		-- vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		-- vim.opt.sessionoptions:remove("tabpages")
		-- end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "Shatur/neovim-session-manager" },
		},
		-- lazy = false,
		-- priority = 100,
	},

	-- {
	--   'lukas-reineke/headlines.nvim',
	--   dependencies = 'nvim-treesitter/nvim-treesitter',
	--   config = true, -- or `opts = {}`
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

	-- --------------------
	-- virtual envs
	-- --------------------
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			-- 'mfussenegger/nvim-dap',
			-- 'mfussenegger/nvim-dap-python', --optional
			{
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup()
		end,
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},

	{
		"anurag3301/nvim-platformio.lua",
		dependencies = {
			{ "akinsho/nvim-toggleterm.lua" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		cmd = {
			"Pioinit",
			"Piorun",
			"Piocmd",
			"Piolib",
			"Piomon",
			"Piodebug",
		},
	},
}
