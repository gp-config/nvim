local M = {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  commit = "d0b297ab233a57bed00ab69bd66135dee111967f",
}

function M.config()
  -- NOTE: set up desired mini.nvim modules here.
  -- LINK: list of available modules (w/ commit SHA): https://github.com/echasnovski/mini.nvim/tree/d0b297ab233a57bed00ab69bd66135dee111967f

  -- TODO: add the default mini-bracketed key binds to which-key
  -- DESC: mini-bracketed
  --       various ways to navigate forwards/backwards using square brackets as a leader key
  require("mini.bracketed").setup()

  -- DESC: mini-indentscope
  --       visualize the current scope with an animated vertical line
  require("mini.indentscope").setup {
    -- Draw options
    draw = {
      -- Delay (in ms) between event and start of drawing scope indicator
      delay = 80,

      -- Animation rule for scope's first drawing. A function which, given
      -- next and total step numbers, returns wait time (in ms). See
      -- |MiniIndentscope.gen_animation| for builtin options. To disable
      --
      -- animation = --<function: implements constant 20ms between steps>,
      animation = require("mini.indentscope").gen_animation.none(),
      -- animation = require("mini.indentscope").gen_animation.quadratic(),
      -- animation = require("mini.indentscope").gen_animation.cubic(),
      -- animation = require("mini.indentscope").gen_animation.linear(), -- DEFAULT
      -- animation = require("mini.indentscope").gen_animation.quartic(),
      -- animation = require("mini.indentscope").gen_animation.exponential(),

      -- Symbol priority. Increase to display on top of more symbols.
      priority = 2,
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    -- mappings = {
    --   -- Textobjects
    --   object_scope = "ii",
    --   object_scope_with_border = "ai",
    --
    --   -- Motions (jump to respective border line; if not present - body line)
    --   goto_top = "[i",
    --   goto_bottom = "]i",
    -- },

    -- Options which control scope computation
    -- options = {
    --   -- Type of scope's border: which line(s) with smaller indent to
    --   -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    --   border = "both",
    --
    --   -- Whether to use cursor column when computing reference indent.
    --   -- Useful to see incremental scopes with horizontal cursor movements.
    --   indent_at_cursor = true,
    --
    --   -- Whether to first check input line to be a border of adjacent scope.
    --   -- Use it if you want to place cursor on function header to get scope of
    --   -- its body.
    --   try_as_border = false,
    -- },

    -- Which character to use for drawing scope indicator
    -- symbol = "╎", -- default
    -- symbol = "┊", -- small dots
    -- symbol = "░", -- blocky
    -- symbol = "▓", -- blocky 2
    -- symbol = "╵", -- wide spaced lines
    symbol = "▕", -- inset line
    -- symbol = "▗",
  }
end

return M
