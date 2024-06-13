require("nvchad.options")
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/luasnip"
vim.g.disable_autoformat = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.keymap.set("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })
require("autocmds")
