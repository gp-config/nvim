--stylua: ignore start
local M = {
  "folke/persistence.nvim",      -- "https://github.com/folke/persistence.nvim",
  event = "BufReadPre",          -- this will only start session saving when an actual file was opened
  opts = {
    -- https://github.com/folke/persistence.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    -- add any custom options here
    dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),              -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" },                 -- sessionoptions used for saving
    pre_save = nil,                                                           -- a function to call before saving the session
    save_empty = false,                                                       -- don't save if there are no open file buffers
  },
}

return M
