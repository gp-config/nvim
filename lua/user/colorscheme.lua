require "user.launch"

local M = {
  -- "LunarVim/primer.nvim",

  -- GP themes
  -- Uncomment to pick one
  --
  -- "folke/tokyonight.nvim",
  -- "lunarvim/darkplus.nvim",
  -- "shaunsingh/oxocarbon.nvim",
  -- "catppuccin/nvim",
  -- "sainnhe/gruvbox-material",
  -- "sainnhe/everforest",
  -- "savq/melange-nvim",
  -- "gp-themes/oxographene.nvim",
  "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" },

  --
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.o.termguicolors = true

  vim.o.background = "dark"
  -- vim.o.background = "light"

  -- GP custom themes
  local colorscheme = "oxographene"

  -- local colorscheme = "zenbones"             -- supports light/dark
  -- local colorscheme = "tokyobones"           -- supports light/dark -- light/dark both nice for elixir
  local colorscheme = "kanagawabones"        -- supports dark       -- nice
  -- local colorscheme = "forestbones"          -- supports light/dark -- dark is nice
  -- local colorscheme = "rosebones"            -- supports light/dark -- rosey colors, dark variant has blue bg
  -- local colorscheme = "vimbones"             -- supports light      -- bright green, it's ok
  -- local colorscheme = "neobones"             -- supports light/dark -- nice -- light is minty, dark is a deep sea blue
  -- local colorscheme = "seoulbones"           -- supports light/dark -- mid -- low contrast, bright colors
  -- local colorscheme = "duckbones"            -- supports dark       -- mid
  -- local colorscheme = "nordbones"            -- supports dark       -- mid

  -- local colorscheme = "catppuccin-latte"     -- light theme (default light bg)
  -- local colorscheme = "catppuccin-mocha"     -- dark theme, darkest variant (default dark bg)
  -- local colorscheme = "catppuccin-macchiato" -- dark theme, medium variant
  -- local colorscheme = "catppuccin-frappe"    -- dark theme, lightest variant

  -- local colorscheme = "tokyonight"           -- base version, supports light/dark
  -- local colorscheme = "tokyonight-day"       -- light theme (default for light bg)
  -- local colorscheme = "tokyonight-night"     -- dark theme, darkest variant
  -- local colorscheme = "tokyonight-storm"     -- dark theme, medium variant (default for dark bg)
  -- local colorscheme = "tokyonight-moon"      -- dark theme, higher contrast variant

  -- local colorscheme = "melange"              -- supports light/dark
  -- local colorscheme = "oxocarbon"            -- supports light/dark
  -- local colorscheme = "gruvbox-material"     -- supports light/dark
  -- local colorscheme = "everforest"           -- supports light/dark

  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
end

return M
