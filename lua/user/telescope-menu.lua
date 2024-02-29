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

            { "LSP: Find References", "Telescope lsp_references" },
            { "LSP: Diagnostics - Warnings and errors for the current buffer", "Telescope Diagnostics" },
            { "LSP: Rename symbol under cursor", "lua vim.lsp.buf.rename()" },
            {
              "LSP: Code Action menu",
              function()
                require("actions-preview").code_actions()
              end,
            },
          },
        },

        format = {
          items = {
            { "Remove all trailing whitespace", "%s/\\s\\+$//e" },
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
              "[sm] Monaspace Xenon h9 linespace 4",
              function()
                vim.opt.guifont = "Monaspace Xenon:h9"
                vim.opt.linespace = 4
              end,
            },
            {
              "[sm] Berkeley Mono h9 linespace 0",
              function()
                vim.opt.guifont = "Berkeley Mono:h9"
                vim.opt.linespace = 0
              end,
            },

            -- MARK: [md]

            {
              "[md] JetBrains Mono h11 linespace 5",
              function()
                vim.opt.guifont = "JetBrains Mono:h11"
                -- vim.opt.linespace = 0
                vim.opt.linespace = 5
              end,
            },
            {
              "[md] Berkeley Mono h11 linespace 0",
              function()
                vim.opt.guifont = "Berkeley Mono:h11"
                vim.opt.linespace = 0
              end,
            },
            {
              "[md] Berkeley Mono h11 linespace 5",
              function()
                vim.opt.guifont = "Berkeley Mono:h11"
                vim.opt.linespace = 5
              end,
            },

            -- MARK: [lg]

            {
              "[lg] Monaspace Xenon SemiBold h11 linespace 8",
              function()
                vim.opt.guifont = "Monaspace Xenon SemiBold:h11"
                vim.opt.linespace = 8
              end,
            },

            {
              "[md] Berkeley Mono h12 linespace 5",
              function()
                vim.opt.guifont = "Berkeley Mono:h12"
                vim.opt.linespace = 5
              end,
            },

            -- MARK: [xl]

            {
              "[xl] Monaspace Xenon SemiBold h13 linespace 8",
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
