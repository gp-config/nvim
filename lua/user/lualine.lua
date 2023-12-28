local M = {
  "nvim-lualine/lualine.nvim",
  commit = "7533b0ead663d80452210c0c089e5105089697e5",
}

local function custom_mode()
  -- Adapted from https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/utils/mode.lua#L6
  local mode_code = vim.api.nvim_get_mode().mode

  local customModeMap = {
    ['n']      = 'N',
    ['no']     = 'O',
    ['nov']    = 'O',
    ['noV']    = 'O',
    ['no\22']  = 'O',
    ['niI']    = 'N',
    ['niR']    = 'N',
    ['niV']    = 'N',
    ['nt']     = 'N',
    ['ntT']    = 'N',
    ['v']      = 'V',
    ['vs']     = 'V',
    ['V']      = 'V',
    ['Vs']     = 'V',
    ['\22']    = 'V',
    ['\22s']   = 'V',
    ['s']      = 'S',
    ['S']      = 'S',
    ['\19']    = 'S',
    ['i']      = 'I',
    ['ic']     = 'I',
    ['ix']     = 'I',
    ['R']      = 'R',
    ['Rc']     = 'R',
    ['Rx']     = 'R',
    ['Rv']     = 'VR',
    ['Rvc']    = 'VR',
    ['Rvx']    = 'VR',
    ['c']      = 'C',
    ['cv']     = 'X',
    ['ce']     = 'X',
    ['r']      = 'R ',
    ['rm']     = 'M ',
    ['r?']     = 'CONFIRM',
    ['!']      = 'SHELL',
    ['t']      = 'TERMINAL',
  }

  if customModeMap[mode_code] == nil then
    return mode_code
  end
  return customModeMap[mode_code]
  -- return '∞ ' .. customModeMap[mode_code]
end

function M.config()
  local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
  local icons = require "user.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  local copilot = function()
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    if #buf_clients == 0 then
      return "LSP Inactive"
    end

    local buf_client_names = {}
    local copilot_active = false

    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end

      if client.name == "copilot" then
        copilot_active = true
      end
    end

    if copilot_active then
      return "%#Copilot#" .. icons.git.Octoface .. "%*"
    end
    return ""
  end

  require("lualine").setup {
    options = {
      -- some extra characters from https://unicode.bayashi.net/?page=1797
      --                
      -- --
      -- blocks
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      -- arrows
      -- component_separators = { left = '', right = ''},
      -- section_separators = { left = '', right = ''},

      -- bubbles
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = '' },

      -- downward slants
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },

      -- upward slants
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },

      -- combined slants
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      --
      -- lualine_a = { "mode" },
      -- lualine_a = { custom_mode },
      -- lualine_b = {},
      -- lualine_c = { },
      -- lualine_w = { diff },
      -- lualine_x = { "diagnostics", copilot  },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "location" },
      --
      lualine_a = { custom_mode },
      lualine_b = {
        {
          "navic",
          -- below: trying to get colored icons rendering, but it's not working.
          --        they aren't colored in the breadcrumbs bar either, so maybe it's colorscheme related.
          -- color_correction = "static",
          -- navic_opts = { highlight = true },
        }
      },
      lualine_c = {},
      lualine_x = { copilot, "diagnostics", diff },
      lualine_y = { "filetype" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end


return M
