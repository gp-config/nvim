-- This plugin will highlight the following comments:
--
-- default keywords:
-- FIX:
-- FIXME:
-- BUG:
-- FIXIT:
-- ISSUE:
-- TODO:
-- HACK:
-- WARN:
-- WARNING:
-- XXX:
-- PERF:
-- PERFORMANCE:
-- OPTIM:
-- OPTIMIZE:
-- NOTE:
-- INFO:
-- TEST:
-- TESTING:
-- PASSED:
-- FAILED:
--
-- custom:
------------
-- GP: for personal comments & attribution
--@GP: for personal comments & attribution
-- LINK: for stand-out URL references
-- ASSERT: for stand-out assertion notes
-- DESC: for 'description' comments in code files ; inline comments that explain a small section of code within a function
-- THEME: for nice formatting of theme descriptions in `user.colorscheme`

local M = {
  "folke/todo-comments.nvim",
  lazy = false,
  commit = "4a6737a8d70fe1ac55c64dfa47fcb189ca431872",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTelescope" },
  opts = {
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "error" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󱦺 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰍨 ", color = "hint" },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      -- custom:
      THEME = { icon = " ", color = "info" },
      DESC = { icon = "󰍨 ", color = "info", alt = { "INFO" } },
      ASSERT = { icon = "⏲ ", color = "test", alt = { "ASSERTION", "CHECK", "GUARD" } },
      LINK = { icon = " ", color = "link" },
      GP = { icon = " ", color = "link" },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
      link = { "#2563EB" },
    },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    PERF = { icon = "󱦺 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
  },
}

return M
