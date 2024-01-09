
-- This plugin will highlight the following comments:
--
-- default keywords:
-- FIX: comments
-- FIXME: comments
-- BUG: comments
-- FIXIT: comments
-- ISSUE: comments
-- TODO: comments
-- HACK: comments
-- WARN: comments
-- WARNING: comments
-- XXX: comments
-- PERF: comments
-- PERFORMANCE: comments
-- OPTIM: comments
-- OPTIMIZE: comments
-- NOTE: comments
-- INFO: comments
-- TEST: comments
-- TESTING: comments
-- PASSED: comments
-- FAILED: comments
-- 
-- custom:
-- THEME: for nice formatting of theme descriptions in `user.colorscheme`
-- DESC: for 'description' comments in code files ; inline comments that explain a small section of code within a function
--       - alternative to INFO


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
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint" },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      -- custom:
      THEME = { icon = " ", color = "info" },
      DESC = { icon = " ", color = "info", alt = { "INFO" } },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
    },
  },
}

return M
