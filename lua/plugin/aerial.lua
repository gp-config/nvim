local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

-- https://github.com/stevearc/aerial.nvim#setup
aerial.setup({
  layout = {
    width = 0.25,
    max_width = 0.5,
    default_direction = "prefer_left",
    placement = "window",
    highlight_on_hover = true,
    preserve_equality = true,
  },

  -- Determines how the aerial window decides which buffer to display symbols for
  --   window - aerial window will display symbols for the buffer in the window from which it was opened
  --   global - aerial window will display symbols for the current window
  attach_mode = "global"
})

