local M = {}

local languages = {
  { treesitter = "lua", lsp = "lua_ls" },
  { lsp = "cssls" },
  { lsp = "html" },
  { lsp = "tsserver" },
  { treesitter = "astro", lsp = "astro" },
  { treesitter = "python", lsp = "pyright" },
  { treesitter = "bash", lsp = "bashls" },
  { lsp = "jsonls" },
  { lsp = "yamlls" },
  { treesitter = "markdown", lsp = "marksman" },
  { treesitter = "markdown-inline" },
  { lsp = "tailwindcss" },
  { treesitter = "elixir", lsp = "lexical" },
  { treesitter = "eex" },
  { treesitter = "heex" },
  { treesitter = "rust", lsp = "rust_analyzer" },
  { treesitter = "svelte", lsp = "svelte" },
}

M.to_install_treesitter = {}
M.to_install_lsp = {}

for value in languages do
  if value.lsp then
    table.insert(M.to_install_lsp, value)
  end

  if value.treesitter then
    table.insert(M.to_install_treesitter, value)
  end
end

return M
