local M = {}

local languages = {
  { treesitter = "lua", lsp = "lua_ls" },
  { treesitter = "css", lsp = "cssls" },
  { lsp = "html" },
  { lsp = "tsserver" },
  { treesitter = "astro", lsp = "astro" },
  { treesitter = "python", lsp = "pyright" },
  { treesitter = "bash", lsp = "bashls" },
  { lsp = "jsonls" },
  { lsp = "yamlls" },
  { treesitter = "markdown", lsp = "marksman" },
  { lsp = "tailwindcss" },
  { treesitter = "elixir", lsp = "lexical" },
  { treesitter = "eex" },
  { treesitter = "heex" },
  { treesitter = "rust", lsp = "rust_analyzer" },
  { treesitter = "svelte", lsp = "svelte" },
}

M.to_install_treesitter = {}
M.to_install_lsp = {}

for _, value in ipairs(languages) do
  if value.lsp ~= nil then
    table.insert(M.to_install_lsp, value.lsp)
  end

  if value.treesitter ~= nil then
    vim.print(value.treesitter)
    table.insert(M.to_install_treesitter, value.treesitter)
  end
end

return M
