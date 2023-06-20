-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--
-- Normal --
-- window navigation
keymap("n", "<leader>v", "<C-w>v")
keymap("n", "<leader>sh", "<C-w>s") -- conflicts with aerial toggle
keymap("n", "<leader>c", "<C-w>c")
keymap("n", "<leader>w<Left>", "<C-w>h")
keymap("n", "<leader>w<Down>", "<C-w>j")
keymap("n", "<leader>w<Up>", "<C-w>k")
keymap("n", "<leader>w<Right>", "<C-w>l")

-- Movement and screen scrolling:
-- Arrow keys (on my keyboard the arrows are on the home row, arranged similar to hjkl) to scroll buffer around middle 
keymap("n", "<Up>", "kzz")
keymap("n", "<Down>", "jzz")
-- Use Shift+Arrow (or hjkl) to move like traditional vim - pressing shift makes this feel like a "precision mode"
keymap("n", "<S-Up>", "k")
keymap("n", "<S-Down>", "j")
-- Jump to next empty line (the { and } keys) also should scroll
keymap("n", "}", "}zz", {noremap = true})
keymap("n", "{", "{zz", {noremap = true})
-- Search jumping should also scroll
keymap("n", "n", "nzz", {noremap = true})
keymap("n", "N", "Nzz", {noremap = true})
-- Apply the above rules to visual block mode too
keymap("x", "<Up>", "kzz")
keymap("x", "<Down>", "jzz")
keymap("x", "<S-Up>", "k")
keymap("x", "<S-Down>", "j")
keymap("x", "}", "}zz", {noremap = true})
keymap("x", "{", "{zz", {noremap = true})

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>q", ":bnext<CR>", opts)
keymap("n", "<leader>z", ":bprevious<CR>", opts)

-- Clear highlights
-- keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<leader>x", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts) -- GP: disabled because colemak

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- LSP
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

--
-- Plugins --
--

-- Telescope
-- keymap("n", "<leader>gp", ":Telescope projects<CR>", opts) -- TODO: needs a project system to run off
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts) -- mnemonic: rg for 'ripgrep'
keymap("n", "<leader>gf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>th", ":Telescope colorscheme<CR>", opts)

-- Git
keymap("n", "lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts) -- calls a function defined in ~/.config/nvim/lua/plugin/toggleterm.lua
keymap("n", "<leader>gb", "<cmd>:Gitsigns toggle_current_line_blame<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)

keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Aerial
keymap("n", "<leader>a", "<cmd>AerialToggle left<cr>", opts) -- toggle symbols panel (aerial)
keymap("n", "<leader>gs", ":Telescope aerial<cr>", opts) -- quick goto symbol using telescope

-- Ranger
keymap("n", "<leader><leader>", ":RnvimrToggle<cr>", opts)

-- No neck pain
keymap("n", "<leader>nn", ":NoNeckPain<cr>", opts)

-- Harpoon
-- h key shows the marks edit window
keymap("n", "<leader>h", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<cr>", opts)
-- keys 1,2,3,4 and their shift variants are to set and navigate to bookmarks
-- 1!
keymap("n", "<leader>1", "<cmd> lua require'harpoon.ui'.nav_file(1)<cr>", opts)
keymap("n", "<leader><S-1>", "<cmd> lua require'harpoon.mark'.add_file(1)<cr>", opts)
-- 2@
keymap("n", "<leader>2", "<cmd> lua require'harpoon.ui'.nav_file(2)<cr>", opts)
keymap("n", "<leader><S-2>", "<cmd> lua require'harpoon.mark'.add_file(2)<cr>", opts)
-- 3#
keymap("n", "<leader>3", "<cmd> lua require'harpoon.ui'.nav_file(3)<cr>", opts)
keymap("n", "<leader><S-3>", "<cmd> lua require'harpoon.mark'.add_file(3)<cr>", opts)
-- 4$
keymap("n", "<leader>4", "<cmd> lua require'harpoon.ui'.nav_file(4)<cr>", opts)
keymap("n", "<leader><S-4>", "<cmd> lua require'harpoon.mark'.add_file(4)<cr>", opts)

-- Leap 
-- keymap("n", "<leader>/", "<Plug>(leap-forward-to)")
-- keymap("n", "<leader>?", "<Plug>(leap-backward-to)")
keymap("n", "<leader>f", "<Plug>(leap-forward-to)")
keymap("n", "<leader>F", "<Plug>(leap-backward-to)")
