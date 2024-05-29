local M = {
  "williamboman/mason.nvim",
  commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("mason").setup {}
end

return M
