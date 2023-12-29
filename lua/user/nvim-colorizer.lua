local M = {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
}

function M.config()
  require("colorizer").setup()
end

return M
