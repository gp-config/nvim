-- use this font for all GUI clients

-- MARK: [md] JetBrains Mono
-- vim.opt.guifont = "JetBrains Mono:h11"
-- vim.opt.linespace = 0
-- vim.opt.linespace = 5

-- MARK: [xl] JetBrains Mono
-- vim.opt.guifont = "JetBrains Mono SemiBold:h13"
-- vim.opt.linespace = 5

-- MARK: [md] Berkeley Mono
vim.opt.guifont = "Berkeley Mono:h11"
vim.opt.linespace = 0
-- vim.opt.linespace = 5

-- MARK: [sm] Monaspace Xenon
-- vim.opt.guifont = "Monaspace Xenon:h9"
-- vim.opt.linespace = 4

-- MARK: [lg] Monaspace Xenon SemiBold
-- vim.opt.guifont = "Monaspace Xenon SemiBold:h11"
-- vim.opt.linespace = 8

-- MARK: [md] Berkeley Mono 12
-- vim.opt.guifont = "Berkeley Mono:h12"
-- vim.opt.linespace = 0
-- vim.opt.linespace = 5

-- MARK: [xl] Monaspace Xenon SemiBold
-- vim.opt.guifont = "Monaspace Xenon SemiBold:h13"
-- vim.opt.linespace = 8

-- NEOVIDE GUI:
-- https://neovide.dev/configuration.html
-- neovide sets this variable on startup. if it's not set, then we're not running in neovide.
if not vim.g.neovide then
  return
else
  vim.opt.clipboard = "" -- disables ext clipboard. tracking bug https://github.com/neovide/neovide/issues/2003

  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 12.0 -- default 7.0

  vim.g.neovide_refresh_rate = 120 -- only has an effect on high refresh displays.
  vim.g.neovide_refresh_rate_idle = 5

  vim.g.neovide_cursor_animation_length = 0.08 -- default 0.13
  vim.g.neovide_cursor_trail_size = 0.5 -- default 0.8

  vim.g.neovide_window_floating_opacity = 1
  vim.g.neovide_window_floating_blur = 1
  vim.g.neovide_floating_blur = 0

  vim.g.neovide_padding_top = 29
  vim.g.neovide_padding_right = 29
  -- vim.g.neovide_padding_bottom = 29 -- command line looks like padding already
  vim.g.neovide_padding_left = 29

  -- vim.g.neovide_scroll_animation_length = 0.15 -- snappy!
  vim.g.neovide_scroll_animation_length = 0.35 -- medium
  -- vim.g.neovide_scroll_animation_length = 0.65 -- smooooooth
end
