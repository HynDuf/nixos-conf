require("nvchad.options")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.scrollback = 100000
vim.o.winborder = 'rounded'
vim.keymap.set("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

-- leap: greying out the search area
vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#696b87" })
vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
	fg = "#a6e3a1",
	bg = "black",
	bold = true,
	nocombine = true,
})

vim.api.nvim_set_hl(0, "FlashLabel", {
	fg = "#a6e3a1",
	bg = "black",
	bold = true,
	nocombine = true,
})

vim.g.vscode_snippets_path = {
	"/home/hynduf/yoru/home/programs/neovim/config/lua/luasnip",
}

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
		float_win_config = {
			border = "rounded",
		},
	},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			local map = vim.keymap.set
			local conf = { signature = true }
			local function opts(desc)
				return { buffer = bufnr, desc = desc }
			end

			map("n", "gD", vim.lsp.buf.declaration, opts("Lsp Go to declaration"))
			map("n", "gd", vim.lsp.buf.definition, opts("Lsp Go to definition"))
			map("n", "gi", vim.lsp.buf.implementation, opts("Lsp Go to implementation"))
			map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Lsp Show signature help"))
			map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Lsp Add workspace folder"))
			map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Lsp Remove workspace folder"))

			map("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts("Lsp List workspace folders"))

			map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Lsp Go to type definition"))

			map("n", "<leader>ra", function()
				require("nvchad.lsp.renamer")()
			end, opts("Lsp NvRenamer"))

			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Lsp Code action"))
			map("n", "gr", vim.lsp.buf.references, opts("Lsp Show references"))

			-- setup signature popup
			if conf.signature and client.server_capabilities.signatureHelpProvider then
				require("nvchad.lsp.signature").setup(client, bufnr)
			end
		end,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {},
		},
	},
	-- DAP configuration
	dap = {},
}

require("autocmds")
