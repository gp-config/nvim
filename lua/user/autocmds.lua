vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

-- NOTE: this command somewhat breaks NoNeckPain layouts; sometimes the window sizing will reset to very small width.
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd "tabdo wincmd ="
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- INFO: format on save
--       on by default. use telescope-menu commands to turn it off per-session.

vim.g.gp__save_on_format_enabled = true
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    if vim.g.gp__save_on_format_enabled then
      vim.lsp.buf.format()
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "WinNew" }, {
--   callback = function()
--     -- INFO: WIP
--     -- WARN: this event doesn't really serve this feature very well!
--     -- INFO: we need one that runs when the user creates a new split.
--
--     -- TODO: count the number of windows that are open
--     -- TODO: if there are > 0 windows, turn no-neck-pain OFF (left-align both splits)
--
--     vim.print("WinNew event fired, num windows: " .. #vim.api.nvim_tabpage_list_wins(0))
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "WinLeave" }, {
--   callback = function()
--     -- INFO: WIP
--     -- WARN: this event doesn't really serve this feature very well!
--     -- INFO: we need one that runs when the user closes a split.
--
--     -- TODO: count the number of windows that are open
--     -- TODO: if there's exactly 1 window, turn no-neck-pain ON (center the single code view)
--
--     vim.print("WinLeave event fired, num windows: " .. #vim.api.nvim_tabpage_list_wins(0))
--   end,
-- })
