local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.add_default_mappings()

local keymap = vim.keymap.set

keymap("n", "<leader>/", "<Plug>(leap-forward-to)")
keymap("n", "<leader>?", "<Plug>(leap-backward-to)")


