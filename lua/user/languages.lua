--stylua: ignore start
local M = {}

local languages = {
  lua        = { treesitter = "lua",        lsp = "lua_ls"        },
  css        = { treesitter = "css",        lsp = "cssls"         },
  tailwind   = {                            lsp = "tailwindcss"   },
  html       = { treesitter = "html",       lsp = "html"          },
  typescript = { treesitter = "typescript", lsp = "tsserver"      },
  astro      = { treesitter = "astro",      lsp = "astro"         },
  python     = { treesitter = "python",     lsp = "pyright"       },
  bash       = { treesitter = "bash",       lsp = "bashls"        },
  json5      = { treesitter = "json5",      lsp = "jsonls"        },
  json       = { treesitter = "json"                              },
  yaml       = { treesitter = "yaml",       lsp = "yamlls"        },
  markdown   = { treesitter = "markdown",   lsp = "marksman"      },
  elixir     = { treesitter = "elixir",     lsp = "elixirls"      },
  eex        = { treesitter = "eex"                               },
  heex       = { treesitter = "heex"                              },
  rust       = { treesitter = "rust",       lsp = "rust_analyzer" },
  svelte     = { treesitter = "svelte",     lsp = "svelte"        },
}
-- NOTE: to align this languages table, use mini-align
--       - select the table in visual mode.
--       - `gas` to enter mini-align split mode. split on the term "= {".
--       - `gv` to re-select the last selection.
--       - `gas` to enter mini-align split mode. split on the term "lsp".
--       - `gv` to re-select the last selection.
--       - `gas` to enter mini-align split mode. split on the term "}".

M.to_install_treesitter = {}
M.to_install_lsp = {}

for _, value in ipairs(languages) do
  if value.lsp ~= nil then
    table.insert(M.to_install_lsp, value.lsp)
  end

  if value.treesitter ~= nil then
    table.insert(M.to_install_treesitter, value.treesitter)
  end
end

return M
