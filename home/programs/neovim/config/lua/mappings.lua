require("nvchad.mappings")

local map = vim.keymap.set

map("n", "<Esc>", "<Esc><cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "j", "gj", { desc = "Move down in wrapped line" })
map("n", "k", "gk", { desc = "Move up in wrapped line" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<A-o>", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<A-b>", "<cmd> Telescope buffers <CR>", { desc = "Find opened files" })
map("n", "mm", ":b#<CR>", { desc = "Open last visited buffer" })
map("n", "<C-z>", function()
	vim.cmd(string.format("silent :wa"))
	vim.cmd(string.format("silent :qa"))
end, { desc = "Save all and close nvim" })

map("n", "<leader>lg", "<cmd> LazyGit <CR>", { desc = "LazyGit Open" })
map("n", "<leader>ls", "<cmd> Lazy sync <CR>", { desc = "Lazy Sync Config" })
map("n", "<leader>o", "<cmd>Portal jumplist backward<CR>", { desc = "Portal Backward" })
map("n", "<leader>i", "<cmd>Portal jumplist forward<CR>", { desc = "Portal Forward" })
map("n", "<leader>co", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- Doesn't work as expected yet
-- map({ "n", "t" }, "<F9>", function()
-- 	require("nvchad.term").runner({
-- 		id = "runner",
-- 		pos = "sp",
-- 		cmd = function()
-- 			local file = vim.fn.expand("%:p")
-- 			local file_wo_ext = vim.fn.expand("%:p:r")
-- 			local ft = vim.bo.ft
-- 			local ft_cmds = {
-- 				python = "python " .. file,
-- 				cpp = "g++ -std=c++17 -O2 -DHynDuf " .. file .. " -o " .. file_wo_ext,
-- 			}
-- 			return ft_cmds[ft]
-- 		end,
-- 		clear_cmd = "",
-- 	})
-- end, { desc = "Code Runner" })
