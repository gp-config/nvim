local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
}

function M.config()
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup {
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          -- TODO: a which-key label for this
          ["<leader>s<Right>"] = { query = { "@parameter.inner", "@attribute.inner" } },
        },
        swap_previous = {
          -- TODO: a which-key label for this
          ["<leader>s<Left>"] = { query = { "@parameter.inner", "@attribute.inner" } },
        },
      },
    },
  }
end

return M
