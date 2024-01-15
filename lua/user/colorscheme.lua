-- THEME:
-- gp :: oxographene
-- based on oxocarbon, with fewer colors.
-- dark theme, low-color, high text contrast.
colorscheme { "gp-themes/oxographene.nvim" }
-- local active = "oxographene"          -- supports dark

-- THEME:
-- Zenbones by mcchrish
-- a set of minimal, low-color themes with high text contrast.
-- lots of good, high-focus light and dark options.
-- colorscheme { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } }
-- -- local active = "zenbones"             -- supports light/dark --
-- -- local active = "tokyobones"           -- supports light/dark -- light/dark both nice for elixir
-- -- local active = "kanagawabones"        -- supports dark       -- nice
-- -- local active = "forestbones" -- supports light/dark -- dark is nice
-- -- local active = "rosebones"            -- supports light/dark -- rosey colors, dark variant has blue bg
-- -- local active = "vimbones"             -- supports light      -- bright green, it's ok
-- -- local active = "neobones"             -- supports light/dark -- nice -- light is minty, dark is a deep sea blue
-- -- local active = "seoulbones"           -- supports light/dark -- mid -- low contrast, bright colors
-- -- local active = "duckbones"            -- supports dark       -- mid
-- -- local active = "nordbones"            -- supports dark       -- mid

-- THEME:
-- Zenbones by mcchrish
-- a set of minimal, low-color themes with high text contrast.
-- lots of good, high-focus light and dark options.
colorscheme {
  "mcchrish/zenbones.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  variants = {
    -- active = "zenbones"             -- supports light/dark --
    -- active = "tokyobones"           -- supports light/dark -- light/dark both nice for elixir
    -- active = "kanagawabones"        -- supports dark       -- nice
    active = "forestbones", -- supports light/dark -- dark is nice
    -- active = "rosebones"            -- supports light/dark -- rosey colors, dark variant has blue bg
    -- active = "vimbones"             -- supports light      -- bright green, it's ok
    -- active = "neobones"             -- supports light/dark -- nice -- light is minty, dark is a deep sea blue
    -- active = "seoulbones"           -- supports light/dark -- mid -- low contrast, bright colors
    -- active = "duckbones"            -- supports dark       -- mid
    -- active = "nordbones"            -- supports dark       -- mid
  },
}
-- local active = "zenbones"             -- supports light/dark --
-- local active = "tokyobones"           -- supports light/dark -- light/dark both nice for elixir
-- local active = "kanagawabones"        -- supports dark       -- nice
-- local active = "forestbones" -- supports light/dark -- dark is nice
-- local active = "rosebones"            -- supports light/dark -- rosey colors, dark variant has blue bg
-- local active = "vimbones"             -- supports light      -- bright green, it's ok
-- local active = "neobones"             -- supports light/dark -- nice -- light is minty, dark is a deep sea blue
-- local active = "seoulbones"           -- supports light/dark -- mid -- low contrast, bright colors
-- local active = "duckbones"            -- supports dark       -- mid
-- local active = "nordbones"            -- supports dark       -- mid

-- THEME:
-- Catppuccin by catppuccin group
-- Cold background, colorful highlighting with warm pastel colors.
colorscheme { "catppuccin/nvim" }
-- local active = "catppuccin-latte"     -- light theme (default light bg)
-- local active = "catppuccin-mocha"     -- dark theme, darkest variant (default dark bg)
local active = "catppuccin-macchiato" -- dark theme, medium variant
-- local active = "catppuccin-frappe"    -- dark theme, lightest variant

colorscheme { "gp-themes/oxographene.nvim" }
-- THEME:
-- tokyonight by folke
-- cold background, colorful, bright highlighting with blues and greens.
colorscheme { "folke/tokyonight.nvim" }
-- local active = "tokyonight"           -- base version, supports light/dark
-- local active = "tokyonight-day"       -- light theme (default for light bg)
-- local active = "tokyonight-night"     -- dark theme, darkest variant
-- local active = "tokyonight-storm"     -- dark theme, medium variant (default for dark bg)
-- local active = "tokyonight-moon"      -- dark theme, higher contrast variant

-- THEME:
-- gruvbox material by sainnhe
-- rustic with vibrant, earthy colors.
colorscheme { "sainnhe/gruvbox-material" }
-- local active = "gruvbox-material"     -- supports light/dark

-- THEME:
-- melange by savq
-- rustic with pastel colors. similar to gruvbox.
colorscheme { "savq/melange-nvim" }
-- local active = "melange"              -- supports light/dark

-- THEME:
-- oxocarbon by shaunsingh
-- bright sci-fi colors; primarily cyan and magenta
colorscheme { "shaunsingh/oxocarbon.nvim" }
-- local active = "oxocarbon"            -- supports light/dark

-- THEME:
-- everforest sainnhe
-- cold background, earthy colors similar to gruvbox. low saturation.
colorscheme { "sainnhe/everforest" }
-- local active = "everforest"           -- supports light/dark

-- THEME:
-- darkplus by the lunarvim group
-- inspired by the VS Code default theme.
-- gray background, lots of cooler colors.
colorscheme { "lunarvim/darkplus.nvim" }
-- local active = "darkplus"            -- supports light/dark

-- THEME:
-- Choose LIGHT or DARK!
--
vim.o.background = "dark"
-- vim.o.background = "light"
vim.o.termguicolors = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. active)
if not status_ok then
  return
end

-- local M = { opts = {} }
--
-- function M.config()
-- end
--
-- return M
