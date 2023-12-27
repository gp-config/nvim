local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  opts = { lsp = { auto_attach = true } }
}

-- NOTE: navbuddy works now, BUT:
-- when this config function is un-commented,
-- the plugin seems to no longer load (Navbuddy is not a recognized editor command).
-- TODO: debug this so we can configure arrow keys as navigation keys.
-- 
-- function M.config()
--   local navbuddy = require("nvim-navbuddy")
--   local actions = require("nvim-navbuddy.actions")
--
--   navbuddy.setup({
--     use_default_mappings = true,
--     mappings = {
--       ["<Down>"] = actions.next_sibling(),
--       ["<Up>"] = actions.previous_sibling(),
--
--       ["<Left>"] = actions.parent(),
--       ["<Right>"] = actions.children(),
--       ["0"] = actions.root(),             -- Move to first panel
--
--       ["v"] = actions.visual_name(),      -- Visual selection of name
--       ["V"] = actions.visual_scope(),     -- Visual selection of scope
--
--       ["d"] = actions.delete(),           -- Delete scope
--
--       ["f"] = actions.fold_create(),      -- Create fold of current scope
--       ["F"] = actions.fold_delete(),      -- Delete fold of current scope
--
--       ["c"] = actions.comment(),          -- Comment out current scope
--       ["<Leader>v"] = actions.vsplit(),   -- Open selected node in a vertical split
--       ["<Leader>sh"] = actions.hsplit(),  -- Open selected node in a horizontal split
--
--       ["g?"] = actions.help(),            -- Open mappings help window
--     }
--   })
-- end

return M
