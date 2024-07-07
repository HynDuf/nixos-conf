vim.opt.clipboard = 'unnamedplus'
vim.keymap.set("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })
