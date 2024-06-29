require("nvchad.options")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.keymap.set("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

-- leap: greying out the search area
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

-- alpha-nvim: "neovim" header color
vim.api.nvim_set_hl(0, "Type", { fg = "#89b4fa" })

vim.g.vscode_snippets_path = {
	"/home/hynduf/yoru/home/programs/neovim/config/lua/luasnip",
}

require("autocmds")
