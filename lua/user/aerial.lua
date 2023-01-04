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
  }
})

