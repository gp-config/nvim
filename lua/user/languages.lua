--stylua: ignore start
local M = {}

local languages = {

  { treesitter = "lua",        lsp = "lua_ls"        },
  { treesitter = "css",        lsp = "cssls"         },
  {                            lsp = "tailwindcss"   },
  { treesitter = "html",       lsp = "html"          },
  { treesitter = "typescript", lsp = "tsserver"      },
  { treesitter = "astro",      lsp = "astro"         },
  { treesitter = "python",     lsp = "pyright"       },
  { treesitter = "bash",       lsp = "bashls"        },
  { treesitter = "json5",      lsp = "jsonls"        },
  { treesitter = "json"                              },
  { treesitter = "yaml",       lsp = "yamlls"        },
  { treesitter = "markdown",   lsp = "marksman"      },
  { treesitter = "elixir"                            }, -- INFO: lexical is the elixir LS in use. it's installed manually on my system, and set up separately in `user.lspconfig`.
  { treesitter = "eex"                               },
  { treesitter = "heex"                              },
  { treesitter = "rust",       lsp = "rust_analyzer" },
  { treesitter = "svelte",     lsp = "svelte"        },
  { treesitter = "fish",                             },
  { treesitter = "c_sharp",    lsp = "csharp_ls"     },

}
-- NOTE: to align this languages table above, use mini-align
--       - select the table in visual mode.
--       - `gas` to enter mini-align split mode. split on the term "lsp =".
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
