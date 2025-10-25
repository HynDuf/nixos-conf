require("nvchad.mappings")

local map = vim.keymap.set

local function find_files_synced()
  local builtin = require("telescope.builtin")
  local opts = {}
  if vim.g.nvim_tree_show_dotfiles == 1 then
    -- Respect .gitignore but include dotfiles
    opts.hidden = true
    opts.no_ignore = false
  end
  builtin.find_files(opts)
end

local function live_grep_synced()
  local builtin = require("telescope.builtin")
  local opts = {}
  -- Use additional_args to avoid clobbering your global Telescope config
  opts.additional_args = function()
    if vim.g.nvim_tree_show_dotfiles == 1 then
      return { "--hidden", "--glob=!.git" }
    end
    return {}
  end
  builtin.live_grep(opts)
end

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

-- MODIFIED: Use our custom function for finding files
map("n", "<A-o>", find_files_synced, { desc = "Find files (sync w/ nvim-tree)" })

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

-- ADDED: Override NvChad's default live_grep to use our custom function
-- The default NvChad keymap for live_grep is <leader>fw
map("n", "<leader>fw", live_grep_synced, { desc = "Live Grep (sync w/ nvim-tree)" })
