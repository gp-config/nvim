local M = {
  -- "https://github.com/folke/flash.nvim",
  "folke/flash.nvim",
  event = "VeryLazy",
  commit = "48817af25f51c0590653bbc290866e4890fe1cbe",
  -- Options here: https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  opts = {
    -- NOTE:
    -- labels below are optimized for a split COLEMAK layout
    labels = "yquwlpjhzxkcdvatriseon",
    label = {
      rainbow = {
        enabled = true,
        -- shade = number between 1 (light) and 9 (dark)
        -- shade = 1,
        -- shade = 2,
        shade = 3,
        -- shade = 4,
        -- shade = 5,
        -- shade = 6,
        -- shade = 7,
        -- shade = 8,
        -- shade = 9,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

return M
