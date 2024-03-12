local M = {
  "octarect/telescope-menu.nvim",
  commit = "9751fc0cb7041ba436c27a86f8faefc5ffe7f8bd",
  event = "VeryLazy",
}

function M.config()
  require("telescope").setup {
    extensions = {
      menu = {
        default = {
          items = {
            -- INFO:
            -- You can add an item of menu in the form of { "<display>", "<command>" }
            --                                         or { "<display>", function() end }
            --                                         or { display = "<display>", value = "<command>" }
            --
            { "Light Mode", "lua vim.o.background = 'light'" },
            { "Dark Mode", "lua vim.o.background = 'dark'" },
            { "SUBMENU: Theme / Colorscheme", "Telescope colorscheme" },
            { "SUBMENU: Neovide", "Telescope menu neovide" },
            { "SUBMENU: Format", "Telescope menu format" },
            { "SUBMENU: Help Tags / User Manual", "Telescope help_tags" },
            { "SUBMENU: Diffview", "Telescope menu diffview" },

            { "LSP: Find References", "Telescope lsp_references" },
            { "LSP: Diagnostics - Warnings and errors for the current buffer", "Telescope Diagnostics" },
            { "LSP: Rename symbol under cursor", "lua vim.lsp.buf.rename()" },
            {
              "LSP: Code Action menu",
              function()
                require("actions-preview").code_actions()
              end,
            },

            { "GIT: View git history for current file", "DiffviewFileHistory %" },
            {
              "Toggle cmp",
              function()
                -- INFO: toggle the variable
                vim.g.gp__cmp_disable_enable_toggle = not vim.g.gp__cmp_disable_enable_toggle

                -- INFO: call cmp setup again, so it'll read the new variable
                require("user.cmp").config()
              end,
            },
          },
        },

        format = {
          items = {
            { "Remove all trailing whitespace", "%s/\\s\\+$//e" },
          },
        },

        diffview = {
          items = {
            { "Close Diffview", "DiffviewClose" },
            { "Open Diffview", "DiffviewOpen" },
            { "Merge Tool", "DiffviewOpen" },
            { "File History (for the current branch)", "DiffviewFileHistory" },
            { "File History (for the current file)", "DiffviewFileHistory %" },
          },
        },
        neovide = {
          items = {
            { "Change font", "Telescope menu gui_font" },
          },
        },

        gui_font = {
          items = {

            -- MARK: [sm]

            {
              "[sm][ls-4] Monaspace Xenon:h9",
              function()
                vim.opt.guifont = "Monaspace Xenon:h9"
                vim.opt.linespace = 4
              end,
            },
            {
              "[sm][ls-0] Berkeley Mono:h9",
              function()
                vim.opt.guifont = "Berkeley Mono:h9"
                vim.opt.linespace = 0
              end,
            },

            -- MARK: [md]

            {
              "[md][ls-5] JetBrains Mono:h11",
              function()
                vim.opt.guifont = "JetBrains Mono:h11"
                -- vim.opt.linespace = 0
                vim.opt.linespace = 5
              end,
            },

            {
              "[lg][ls-3] Monaspace Xenon:h10",
              function()
                vim.opt.guifont = "Monaspace Xenon:h10"
                vim.opt.linespace = 3
              end,
            },

            {
              "[md][ls-0] Berkeley Mono:h11",
              function()
                vim.opt.guifont = "Berkeley Mono:h11"
                vim.opt.linespace = 0
              end,
            },

            {
              "[md][ls-5] Berkeley Mono:h11",
              function()
                vim.opt.guifont = "Berkeley Mono:h11"
                vim.opt.linespace = 5
              end,
            },

            -- MARK: [lg]

            {
              "[lg][ls-8] Monaspace Xenon SemiBold:h11",
              function()
                vim.opt.guifont = "Monaspace Xenon SemiBold:h11"
                vim.opt.linespace = 8
              end,
            },

            {
              "[md][ls-5] Berkeley Mono:h12",
              function()
                vim.opt.guifont = "Berkeley Mono:h12"
                vim.opt.linespace = 5
              end,
            },

            -- MARK: [xl]

            {
              "[xl][ls-8] Monaspace Xenon SemiBold:h13",
              function()
                vim.opt.guifont = "Monaspace Xenon SemiBold:h13"
                vim.opt.linespace = 8
              end,
            },
          },
        },
      },
    },
  }

  require("telescope").load_extension "menu"
end

return M
