local autocmd = vim.api.nvim_create_autocmd

-- Fcitx5 typing
local fcitx_cur = "bamboo"
local fcitx_en  = "keyboard-us"

local function has_fcitx()
  return vim.fn.executable("fcitx5-remote") == 1
end

local function trim(s) return (s or ""):gsub("%s+$","") end

local function current_im()
  local f = io.popen("fcitx5-remote -n", "r")
  if not f then return nil end
  local out = f:read("*a")
  f:close()
  return trim(out)
end

local function switch_im(target)
  if not target or target == "" then return end
  local cur = current_im()
  if cur == target then return end
  os.execute(string.format('fcitx5-remote -s %q', target))
end

autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    if not has_fcitx() then return end
    switch_im(fcitx_cur)
  end,
})

autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if not has_fcitx() then return end
    local im = current_im()
    if im and im ~= "" then
      fcitx_cur = im  -- remember what you used in Insert for next time
    end
    switch_im(fcitx_en)
  end,
})

---@param padding_amount integer
---@param margin_amount integer
local set_spacing = function(padding_amount, margin_amount)
	-- locar command = string.format('kitty @ set-spacing padding=%d margin=%d', padding_amount, margin_amount)
	vim.fn.system({
		"kitty",
		"@",
		"set-spacing",
		"padding=" .. padding_amount,
		"margin-h=" .. margin_amount,
	})
end

set_spacing(0, 0)

vim.api.nvim_create_autocmd("VimLeave", {
	once = true,
	callback = function()
		set_spacing(0, 20)
	end,
})

-- auto reload buffer when changed
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	callback = function()
		if vim.api.nvim_get_mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})

autocmd("FileChangedShellPost", {
	callback = function()
		vim.cmd(([[echohl WarningMsg | echomsg "%s" | echohl None]]):format("File changed on disk. Buffer reloaded."))
	end,
})

autocmd("BufRead", {
	pattern = { "*.inp", "*.out" },
	callback = function()
		vim.cmd(string.format("setlocal nornu"))
	end,
})

autocmd("FileType", {
	pattern = {"lua", "nix"},
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})
