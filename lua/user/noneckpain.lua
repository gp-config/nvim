local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  commit = "b305821ca45897db6276e9ae5893747bb24040c7",
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  keymap("n", "<leader>nn", ":NoNeckPain<cr>", opts)
end

return M
