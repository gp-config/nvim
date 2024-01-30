local M = {
  "simonmclean/triptych.nvim",
  commit = "a0017e8d94d250338246a24fa07f200e4d0c5635",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-tree/nvim-web-devicons", -- optional
  },
}

function M.config()
  -- LINK: default config: https://github.com/simonmclean/triptych.nvim?tab=readme-ov-file#%EF%B8%8F-configuration

  require("triptych").setup {
    mappings = {
      nav_left = "<Left>",
      nav_right = "<Right>",
    },
  }

  vim.keymap.set("n", "<leader><leader>", ":Triptych<CR>", { silent = true })
end

return M
