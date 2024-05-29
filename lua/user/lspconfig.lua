local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  commit = "9266dc26862d8f3556c2ca77602e811472b4c5b8",
  dependencies = {
    "williamboman/mason.nvim", -- NOTE: this is set up in a different file `user.mason`. it's just here for redundancy, since mason-lspconfig needs it.
    "williamboman/mason-lspconfig.nvim", -- NOTE: this is what automatically installs all configured LSPs.
    {
      "folke/neodev.nvim",
      commit = "b094a663ccb71733543d8254b988e6bebdbdaca4",
    },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "<leader>lca", "<cmd>lua require('actions-preview').code_actions()<CR>", opts)
  keymap(bufnr, "n", "<leader>lcf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  keymap(bufnr, "n", "<leader>rr", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

function M.config()
  require("mason-lspconfig").setup {
    automatic_installation = true,
  }

  local ensure_installed = require("user.languages").to_install_lsp
  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(ensure_installed) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    lspconfig[server].setup(opts)
  end

  -- SECTION: lexical (elixir language server) setup
  local configs = require "lspconfig.configs"

  local lexical_config = {
    filetypes = { "elixir", "eelixir", "heex" },
    cmd = { "/home/gp/github/lexical-lsp/lexical/_build/dev/package/lexical/bin/start_lexical.sh" }, -- DANGER: hardcoded path here!
    settings = {},
  }

  if not configs.lexical then
    configs.lexical = {
      default_config = {
        filetypes = lexical_config.filetypes,
        cmd = lexical_config.cmd,
        root_dir = function(fname)
          return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
        end,
        -- optional settings
        settings = lexical_config.settings,
      },
    }
  end
  lspconfig.lexical.setup {}
  -- END: lexical (elixir language server) setup
end

return M
