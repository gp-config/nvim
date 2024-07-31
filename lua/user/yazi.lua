local M = {
  "mikavilpas/yazi.nvim",
  commit = "365c11668d935520fe8e672d3cf2e3e24ad105f1",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader><leader>",
      function()
        require("yazi").yazi()
      end,
      desc = "Open the file manager (yazi)",
    },
    -- {
    --   -- Open in the current working directory
    --   "<leader>cw",
    --   function()
    --     require("yazi").yazi(nil, vim.fn.getcwd())
    --   end,
    --   desc = "Open the file manager in nvim's working directory" ,
    -- },
    -- {
    --   '<c-up>',
    --   function()
    --     -- NOTE: requires a version of yazi that includes
    --     -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
    --     require('yazi').toggle()
    --   end,
    --   desc = "Resume the last yazi session",
    -- },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,

    -- enable these if you are using the latest version of yazi
    -- use_ya_for_events_reading = true,
    -- use_yazi_client_id_flag = true,

    keymaps = {
      show_help = "<f1>",
    },
  },
}

function M.config()
  require("yazi").setup {
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader><leader>",
        function()
          require("yazi").yazi()
        end,
        desc = "Open the file manager (yazi)",
      },
      -- {
      --   -- Open in the current working directory
      --   "<leader>cw",
      --   function()
      --     require("yazi").yazi(nil, vim.fn.getcwd())
      --   end,
      --   desc = "Open the file manager in nvim's working directory" ,
      -- },
      -- {
      --   '<c-up>',
      --   function()
      --     -- NOTE: requires a version of yazi that includes
      --     -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      --     require('yazi').toggle()
      --   end,
      --   desc = "Resume the last yazi session",
      -- },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,

      -- enable these if you are using the latest version of yazi
      -- use_ya_for_events_reading = true,
      -- use_yazi_client_id_flag = true,

      keymaps = {
        show_help = "<f1>",
      },
    },
  }
end

return M
