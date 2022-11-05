local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

-- https://github.com/folke/which-key.nvim#-configuration
whichkey.setup { }
