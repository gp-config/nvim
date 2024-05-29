local M = {
  "nvim-telescope/telescope.nvim",
  -- TODO: can we specify a specific commit of each dependency to use?
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    "debugloop/telescope-undo.nvim",
  },
  commit = "74ce793a60759e3db0d265174f137fb627430355",
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      file_ignore_patterns = { ".git/", "node_modules" },

      mappings = {
        i = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      -- Themes docs: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#themes
      live_grep = {
        theme = "ivy",
      },

      grep_string = {
        theme = "ivy",
      },

      find_files = {
        theme = "ivy",
        previewer = false,
      },

      buffers = {
        theme = "ivy",
        -- previewer = false,
        -- initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      oldfiles = {
        theme = "ivy",
        -- initial_mode = "normal",
        -- theme = "dropdown",
        -- previewer = false,
        --
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        theme = "ivy",
        enable_preview = true,
      },

      lsp_references = {
        -- theme = "dropdown",
        theme = "ivy",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "ivy",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "ivy",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "ivy",
        initial_mode = "normal",
      },

      lsp_document_symbols = {
        theme = "ivy",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      undo = {},
    },
  }

  require("telescope").load_extension "undo"

  --- telescope global search for highlighted text
  --- thanks to: adoyle-h on github https://github.com/nvim-telescope/telescope.nvim/issues/1923#issuecomment-1122642431

  function vim.getVisualSelection()
    vim.cmd 'noau normal! "vy"'
    local text = vim.fn.getreg "v"
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
      return text
    else
      return ""
    end
  end

  vim.keymap.set("v", "<space>g", function()
    local text = vim.getVisualSelection()
    require("telescope.builtin").live_grep { default_text = text }
  end, { noremap = true, silent = true })

  --- end telescope global search for highlighted text
end

return M
