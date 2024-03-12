local M = {
  "DreamMaoMao/yazi.nvim",
  commit = "b5c9390c733244b10859b940413ef9741955301a",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader><leader>", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
  },
}

-- function M.config()
--
-- end

return M
