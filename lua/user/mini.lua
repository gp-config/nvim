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
end

return M
