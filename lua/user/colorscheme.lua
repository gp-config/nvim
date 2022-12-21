-- BACKGROUND COLOR
-- automatically chooses a light/dark version for some themes
--
vim.o.background = "dark"
-- vim.o.background = "light"

--
-- CATPPUCCIN
-- does not seem to support 'background' option
-- 
-- local colorscheme = "catppuccin-latte" -- light theme (default light)
-- local colorscheme = "catppuccin-mocha" -- dark theme, darkest variant (default dark)
-- local colorscheme = "catppuccin-macchiato" -- dark theme, medium variant
-- local colorscheme = "catppuccin-frappe" -- dark theme, lightest variant

--
-- TOKYONIGHT
--
-- local colorscheme = "tokyonight" -- base version, uses 'background' option to choose either 'day' or 'storm'
-- local colorscheme = "tokyonight-day"
local colorscheme = "tokyonight-night" -- dark theme, darkest variant
-- local colorscheme = "tokyonight-storm" -- dark theme, medium variant (default dark)
-- local colorscheme = "tokyonight-moon" -- dark theme, higher contrast variant

--
-- MISC
--
-- local colorscheme = "oxocarbon" -- supports light/dark background option
-- local colorscheme = "gruvbox-material" -- support light/dark background option
-- local colorscheme = "everforest" -- support light/dark background option

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
