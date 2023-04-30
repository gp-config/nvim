local status_ok, noneckpain = pcall(require, "no-neck-pain")
if not status_ok then
	return
end

-- https://github.com/shortcuts/no-neck-pain.nvim/wiki/Showcase
noneckpain.setup {
  width = 120,
}
