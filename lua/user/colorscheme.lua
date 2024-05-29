--stylua: ignore start
require "user.launch"

local function set_colorscheme(colorscheme)
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
end

-- INFO: create an autocmd for the given file type.
--       when it runs, it will set the current color scheme.
local function define_language_colors(opts)
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    pattern = opts.filetype,
    callback = function()

      -- INFO: call the `before` callback if its defined;
      --       it's for writing additional theme setup code before setting the color scheme.
      --       stuff like setting `g:gruvbox_material_background = 'hard'`
      if opts.before then
        opts.before()
      end

      if vim.o.background == "light" then
        set_colorscheme(opts.litemode)
        -- print("[AUTO THEME][LIGHT MODE]", opts.filetype, opts.litemode)
      else
        -- print("[AUTO THEME][DARK MODE]", opts.filetype, opts.darkmode)
        set_colorscheme(opts.darkmode)
      end

      -- INFO: call the `after` callback if its defined
      if opts.after then
        opts.after()
      end
    end
  })
end

local M = {
  "LunarVim/primer.nvim",
  dependencies = {
    "rktjmp/lush.nvim",
    "gp-themes/oxographene.nvim",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
    "sainnhe/gruvbox-material",
    "savq/melange-nvim",
    "shaunsingh/oxocarbon.nvim",
    "sainnhe/everforest",
    "lunarvim/darkplus.nvim",
    "mcchrish/zenbones.nvim",
  },

  lazy = false,
  priority = 1000,
}

function M.config()
  vim.o.termguicolors = true

  -- THEME:
  -- Choose LIGHT or DARK!
  --
  -- vim.o.background = "dark"
  vim.o.background = "light"

  -- THEME:
  -- gp :: oxographene
  -- based on oxocarbon, with fewer colors.
  -- dark theme, low-color, high text contrast.
  --
  -- local colorscheme = "oxographene"          -- supports dark

  -- THEME:
  -- Zenbones by mcchrish
  -- a set of minimal, low-color themes with high text contrast.
  -- lots of good, high-focus light and dark options.
  --
  local colorscheme = "zenbones"             -- supports light/dark --
  -- local colorscheme = "tokyobones"           -- supports light/dark -- light/dark both nice for elixir
  -- local colorscheme = "kanagawabones"        -- supports dark       -- nice
  -- local colorscheme = "forestbones"          -- supports light/dark -- dark is nice
  -- local colorscheme = "rosebones"             -- supports light/dark -- rosey colors, dark variant has blue bg
  -- local colorscheme = "vimbones"             -- supports light      -- bright green, it's ok
  -- local colorscheme = "neobones"             -- supports light/dark -- nice -- light is minty, dark is a deep sea blue
  -- local colorscheme = "seoulbones"           -- supports light/dark -- mid -- low contrast, bright colors
  -- local colorscheme = "duckbones"            -- supports dark       -- kind anice for HTML
  -- local colorscheme = "nordbones"            -- supports dark       -- mid
  -- local colorscheme = "randombones"          -- picks a random zenbones theme --
  --

  -- THEME:
  -- Catppuccin by catppuccin group
  -- Cold background, colorful highlighting with warm pastel colors.
  --
  -- local colorscheme = "catppuccin-latte"     -- light theme (default light bg)
  -- local colorscheme = "catppuccin-mocha"     -- dark theme, darkest variant (default dark bg)
  -- local colorscheme = "catppuccin-macchiato" -- dark theme, medium variant
  -- local colorscheme = "catppuccin-frappe"    -- dark theme, lightest variant

  -- THEME:
  -- tokyonight by folke
  -- cold background, colorful, bright highlighting with blues and greens.
  --
  -- local colorscheme = "tokyonight"           -- base version, supports light/dark
  -- local colorscheme = "tokyonight-day"       -- light theme (default for light bg)
  -- local colorscheme = "tokyonight-night"     -- dark theme, darkest variant
  -- local colorscheme = "tokyonight-storm"     -- dark theme, medium variant (default for dark bg)
  -- local colorscheme = "tokyonight-moon"      -- dark theme, higher contrast variant

  -- THEME:
  -- gruvbox material by sainnhe
  -- rustic with vibrant, earthy colors.
  --
  -- local colorscheme = "gruvbox-material"     -- supports light/dark

  -- THEME:
  -- melange by savq
  -- rustic with pastel colors. similar to gruvbox.
  --
  -- local colorscheme = "melange"              -- supports light/dark

  -- THEME:
  -- everforest sainnhe
  -- cold background, earthy colors similar to gruvbox. low saturation.
  --
  -- local colorscheme = "everforest"           -- supports light/dark

  -- THEME:
  -- oxocarbon by shaunsingh
  -- bright sci-fi colors; primarily cyan and magenta
  --
  -- local colorscheme = "oxocarbon"            -- supports light/dark

  -- THEME:
  -- darkplus by the lunarvim group
  -- inspired by the VS Code default theme.
  -- gray background, lots of cooler colors.
  --
  -- local colorscheme = "darkplus"            -- supports light/dark

  -- THEME:
  -- quiet (built in theme)
  -- light or dark, very minimal
  --
  -- local colorscheme = "quiet"                  -- light/dark




  -- INFO: set the fallback/default colorscheme

  set_colorscheme(colorscheme)

  -- INFO: auto-set colorscheme for certain file types

  define_language_colors({
    filetype = "*.rs",
    litemode = "tokyobones",
    darkmode = "gruvbox-material",
    before = function()
      vim.g.gruvbox_material_background = "hard"
    end,
  })

  define_language_colors({
    filetype = "*.ts,*.js,*.tsx,*.jsx",
    litemode = "tokyobones",
    darkmode = "catppuccin-mocha",
  })

  define_language_colors({
    filetype = "*.lua",
    litemode = "vimbones",
    darkmode = "everforest",
  })

  define_language_colors({
    filetype = "*.svelte,*.svelte.ts,*.svelte.js",
    litemode = "melange",
    darkmode = "melange",
  })

  define_language_colors({
    filetype = "*.vue",
    litemode = "neobones",
    darkmode = "everforest",
  })
end

return M
