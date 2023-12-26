-- If this plugin starts misbehaving, run `:checkhealth rnvimr` for some diagnostics.
-- This depends on a few packages external to neovim; `ranger` , `python-pynvim`
-- Check the project README for more details: https://github.com/kevinhwang91/rnvimr?tab=readme-ov-file#dependence
--
-- Dec 26 2023 troubleshooting:
-- Installing this plugin required updates to system dependencies, namely `python-pynvim`.
--
-- On Manjaro OS: Installing via `yay -S python-pynvim` did not work; it tried to install version `python-pynvim-0.5.0-1`, but
-- the package repositories all returned a 404 for this version.
-- Installing via `pamac install python-pynvim` worked, and installed version `python-pynvim-0.5.0-2`.
-- (found package on https://software.manjaro.org/package/python-pynvim)
--

local M = {
  "kevinhwang91/rnvimr",
  event = "VeryLazy",
  commit = "5f0483d1c107ab1fe7e0af08cdf7900aa0dcb40e",
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  keymap("n", "<leader><leader>", ":RnvimrToggle<cr>", opts)

  vim.g.rnvimr_hide_gitignore = 1 -- hide files in gitignore (good for not accidentally 'hovering' an env or secrets file)
  vim.g.rnvimr_enable_ex = 1 -- replace netrw as the default file explorer
  vim.g.rnvimr_enable_picker = 1 -- hide ranger after picking a file
  -- vim.g.rnvimr_edit_cmd = 'drop' -- doesn't do as expected, not sure what this is for
  -- vim.g.rnvimr_shadow_windowblend = 70
  vim.g.rnvimr_draw_border = 0
end

return M
