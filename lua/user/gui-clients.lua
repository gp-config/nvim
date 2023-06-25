-- use this font for all GUI clients
-- vim.opt.guifont = "JetBrains Mono:h12"
vim.opt.guifont = "Berkeley Mono:h11"
vim.opt.linespace = 5

-- NEOVIDE GUI:
-- https://neovide.dev/configuration.html
-- neovide sets this variable on startup. if it's not set, then we're not running in neovide.
if not vim.g.neovide then
  return
else
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_refresh_rate = 120 -- only has an effect on high refresh displays

  vim.g.neovide_cursor_animation_length = 0.05 -- default 0.13
  vim.g.neovide_cursor_trail_size = 0.5 -- default 0.8

  vim.g.neovide_window_floating_opacity = 1
  vim.g.neovide_window_floating_blur = 1
  vim.g.neovide_floating_blur = 0
end
