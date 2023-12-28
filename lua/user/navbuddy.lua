local M = {
  "SmiteshP/nvim-navbuddy",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local navbuddy = require("nvim-navbuddy")
    local actions = require("nvim-navbuddy.actions")

    navbuddy.setup({
      lsp = { auto_attach = true },
      use_default_mappings = true,
      mappings = {
        ["<Down>"] = actions.next_sibling(),
        ["<Up>"] = actions.previous_sibling(),

        ["<Left>"] = actions.parent(),
        ["<Right>"] = actions.children(),
        ["0"] = actions.root(),             -- Move to first panel

        ["v"] = actions.visual_name(),      -- Visual selection of name
        ["V"] = actions.visual_scope(),     -- Visual selection of scope

        ["d"] = actions.delete(),           -- Delete scope

        ["f"] = actions.fold_create(),      -- Create fold of current scope
        ["F"] = actions.fold_delete(),      -- Delete fold of current scope

        ["c"] = actions.comment(),          -- Comment out current scope
        ["<Leader>v"] = actions.vsplit(),   -- Open selected node in a vertical split
        ["<Leader>sh"] = actions.hsplit(),  -- Open selected node in a horizontal split

        ["g?"] = actions.help(),            -- Open mappings help window
      }
    })
  end
}

return M
