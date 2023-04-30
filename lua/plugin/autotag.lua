local status_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	return
end

-- https://github.com/windwp/nvim-ts-autotag#setup
autotag.setup()
