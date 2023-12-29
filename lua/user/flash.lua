local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  commit = "48817af25f51c0590653bbc290866e4890fe1cbe",
  -- Options here: https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  opts = {
    -- TODO: replace with my COLEMAK labels from work pc ideavim config!
    -- labels = "asdfghjklqwertyuiopzxcvbnm",
    label = {
      rainbow = {
        enabled = true,
        shade = 2 -- number between 1 (light) and 9 (dark)
      }
    }
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
