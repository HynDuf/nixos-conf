-- local configs = require 'nvchad.configs.lspconfig'
local map = vim.keymap.set
local M = {}
local conf = { signature = true }

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = desc }
	end
	if client.name == "ruff" then
		client.server_capabilities.hoverProvider = false
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
end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.defaults = function()
	dofile(vim.g.base46_cache .. "lsp")
	require("nvchad.lsp")

	require("lspconfig").lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
						[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	})
end

local on_init = M.on_init
local on_attach = M.on_attach
local capabilities = M.capabilities

local lspconfig = require("lspconfig")
local servers = { "ruff", "html", "cssls", "ts_ls", "gopls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.clangd.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--header-insertion=never",
	},
})

lspconfig.pyright.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})

lspconfig.tinymist.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		formatterMode = "typstfmt",
		formatterPrintWidth = 90,
	},
})
return M
