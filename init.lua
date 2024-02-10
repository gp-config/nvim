--stylua: ignore start
require "user.launch"                     -- neovim framework (Launch.nvim)
require "user.options"                    -- vim.opt settings
require "user.gui-clients"                -- settings specific to GUI clients (e.g. neovide)
require "user.keymaps"                    -- basic key bindings (there's more keybinds in which-key and other plugin configuration)
require "user.autocmds"                   -- vim auto-commands (vim.api.nvim_create_autocmd)
--
spec "user.colorscheme"                   -- colors!
spec "user.devicons"                      -- icons!
spec "user.treesitter"                    -- treesitter: syntax highlighting engine
spec "user.lspconfig"                     -- lspconfig: language servers
spec "user.cmp"                           -- cmp: completion engine
spec "user.dap"                           -- dap: debugger engine
spec "user.dapinstall"                    -- dapinstall: installer for debug servers
spec "user.noice"                         -- noice: experimental vim command line & messages UI
spec "user.mason"                         -- mason: package manager UI
spec "user.dapui"                         -- dapui: debugger UI
spec "user.navic"                         -- navic: statusline breadcrumbs UI
spec "user.trouble"                       -- trouble: diagnostics list UI
-- spec "user.rnvimr"                        -- DISABLED: trying out triptych for a bit instead -- rnvimr: use ranger as nvim's file browser UI (ranger needs to be installed on the system)
spec "user.triptych"                      -- triptych: pure lua/nvim implementation of a ranger-style file browser UI
spec "user.navbuddy"                      -- navbuddy: structure navigation UI
spec "user.lualine"                       -- lualine: statusline UI framework
spec "user.telescope"                     -- telescope: fuzzy-finder UI framework
spec "user.toggleterm"                    -- toggleterm: embedded terminal UI
spec "user.whichkey"                      -- whichkey: keybind framework & keybind discovery UI
spec "user.diffview"                      -- diffview: git diffs & history UI   (great for viewing file history)
spec "user.schemastore"                   -- schemastore: autocomplete for common config file types
spec "user.null-ls"                       -- null-ls: direct API for LSPs. often used for code formatters.
spec "user.illuminate"                    -- illuminate: highlight other occurrences of the word under your cursor
spec "user.autopairs"                     -- autopairs: auto-close brackets etc
spec "user.comment"                       -- comment: smart commenting
spec "user.gitsigns"                      -- gitsigns: gutter decorations indicating git status
-- spec "user.indentline"                    -- DISABLED: preferring clean look rn -- indentline: indent guides / indent lines
spec "user.bufdelete"                     -- bufdelete: alternative buffer deletion
spec "user.noneckpain"                    -- noneckpain: centered code view
spec "user.cloak"                         -- cloak: visually hide sensitive strings
spec "user.multicursor"                   -- multicursor: multiple cursor support
spec "user.nvim-colorizer"                -- nvim-colorizer: inline preview for hex codes & rgb colors
spec "user.hotpot"                        -- hotpot: compiler for the "fennel" lisp dialect
spec "user.flash"                         -- flash: visual search & jump targets
spec "user.todo-comments"                 -- todo comments: highlight & emphasize comment labels
spec "user.twilight"                      -- twilight: lowlight code that's far away from the cursor
spec "user.obsidian"                      -- obsidian: support obsidian.md vaults
spec "user.persistence"                   -- persistence: auto-save the session on nvim quit -- use this alongside an autocmd to re-open the last session for the current folder on startup!
spec "user.nvim-treesitter-textobjects"   -- nvim-treesitter-textobjects: select, move, or swap treesitter nodes
spec "user.firenvim"
spec "user.telescope-menu"                -- telescope-menu: define custom menus, displayed by telescope
--
require "user.lazy"                       -- lazy: plugin management framework - installs every `spec` above
