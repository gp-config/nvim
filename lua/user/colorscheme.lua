-- vim.o.background = "dark" -- loads dark version for some themes
vim.o.background = "light" -- loads light version for some themes

-- local colorscheme = "tokyonight-night"
local colorscheme = "oxocarbon"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
