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
            {
              "Light Mode",
              function()
                require("user.submodules.colormode-saver").set_color_mode "light"
              end,
            },
            {
              "Dark Mode",
              function()
                require("user.submodules.colormode-saver").set_color_mode "dark"
              end,
            },
            { "SUBMENU: Theme / Colorscheme", "Telescope colorscheme" },
            { "SUBMENU: Neovide", "Telescope menu neovide" },
            { "SUBMENU: Format", "Telescope menu format" },
            { "SUBMENU: Help Tags / User Manual", "Telescope help_tags" },
            { "SUBMENU: Diffview", "Telescope menu diffview" },
            { "Toggle Twilight (code lowlighting / focus mode)", "Twilight" },
            { "TreeSitter: InspectTree", "InspectTree" },
            { "Undo/Redo History for current buffer", "Telescope undo" },
            { "Jumplist History", "Telescope jumplist" },
            { "List TODO Comments (Telescope)", "TodoTelescope keywords=TODO" },
            { "List LATER Comments (Telescope)", "TodoTelescope keywords=LATER" },
            {
              "Enable auto-colorscheme for file type",
              function()
                vim.g.gp_autocolor_enabled = true
              end,
            },
            {
              "Disable auto-colorscheme for file type",
              function()
                vim.g.gp_autocolor_enabled = false
              end,
            },

            {
              "Enable format on save",
              function()
                vim.g.gp__save_on_format_enabled = true
              end,
            },
            {
              "Disable format on save",
              function()
                vim.g.gp__save_on_format_enabled = false
              end,
            },

            { "LspInfo", "LspInfo" },
            { "LSP: Find References / Usages", "Telescope lsp_references" },
            { "LSP: Diagnostics - Warnings and errors for the current buffer", "Telescope Diagnostics" },
            { "LSP: Rename symbol under cursor", "lua vim.lsp.buf.rename()" },
            {
              "LSP: Code Action menu",
              function()
                require("actions-preview").code_actions()
              end,
            },

            -- WARN: this block of commands is also in the `diffview` sub-menu!
            { "Close Diffview", "DiffviewClose" },
            { "GIT: File History (for the current file)", "DiffviewFileHistory %" },
            { "GIT: File History (for the current branch)", "DiffviewFileHistory" },
            { "GIT: File History (for the current line)", ".DiffviewFileHistory --follow" },

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

            -- WARN: this block of commands is also in the main menu!
            { "File History (for the current branch)", "DiffviewFileHistory" },
            { "File History (for the current file)", "DiffviewFileHistory %" },
            { "File History (for the current line)", ".DiffviewFileHistory --follow" },
          },
        },
        neovide = {
          items = {
            { "Change font", "Telescope menu gui_font" },
          },
        },

        -- NOTE: import
        gui_font = require("user.gui-clients").gui_font_options or {
          items = {
            {
              "This does not appear to be a GUI client, so there are no font options here.",
              "echo",
            },
          },
        },
      },
    },
  }

  require("telescope").load_extension "menu"
end

return M
