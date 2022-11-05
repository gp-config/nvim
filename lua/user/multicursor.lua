local status_ok, multicursor = pcall(require, "vim-visual-multi")
if not status_ok then
	return
end

multicursor.setup { }
