-- NOTE: Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- C-Space to open which-key
keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- window navigation
keymap("n", "<leader>v", "<C-w>v<C-w>h")
keymap("n", "<leader>sh", "<C-w>s") -- conflicts with aerial toggle
keymap("n", "<leader>c", "<C-w>c")
keymap("n", "<leader>w<Left>", "<C-w>h")
keymap("n", "<leader>w<Down>", "<C-w>j")
keymap("n", "<leader>w<Up>", "<C-w>k")
keymap("n", "<leader>w<Right>", "<C-w>l")

-- Resize windows with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Movement and screen scrolling:
-- Arrow keys (on my keyboard the arrows are on the home row, arranged similar to hjkl) to scroll buffer around middle
    -- keymap("n", "<Up>", "kzz")
    -- keymap("n", "<Down>", "jzz")
-- Use Shift+Arrow (or hjkl) to move like traditional vim - pressing shift makes this feel like a "precision mode"
    -- keymap("n", "<S-Up>", "k")
    -- keymap("n", "<S-Down>", "j")
-- Apply the above rules to visual block mode too:
    -- keymap("x", "<Up>", "kzz")
    -- keymap("x", "<Down>", "jzz")
    -- keymap("x", "<S-Up>", "k")
    -- keymap("x", "<S-Down>", "j")
-- Jump to next empty line (the { and } keys) also should scroll
keymap("n", "}", "}zz", {noremap = true})
keymap("n", "{", "{zz", {noremap = true})
-- Search jumping should also scroll
keymap("n", "n", "nzz", {noremap = true})
keymap("n", "N", "Nzz", {noremap = true})
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Navigate buffers
keymap("n", "<leader>q", ":bnext<CR>", opts)
keymap("n", "<leader>z", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear highlights
keymap("n", "<leader>x", "<cmd>nohlsearch<CR>", opts)

-- Paste-and-replace without yanking in visual & visual block mode
keymap("x", "p", [["_dP]])
keymap("v", "p", [["_dP]])

-- LSP
-- Find additional LSP keybinds in `lspconfig.lua # lsp_keymaps()`

-- LSP mouse support
vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]
vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")


--
-- PLUGINS -- -- --
--

-- Telescope
-- Find additional telescope keybinds in `telescope.lua` under "mappings".
-- keymap("n", "<leader>gp", ":Telescope projects<CR>", opts) -- TODO: needs a project system to run off
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts) -- mnemonic: rg for 'ripgrep'
keymap("n", "<leader>gf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>th", ":Telescope colorscheme<CR>", opts)

-- Git
-- TODO: plugin setup
-- keymap("n", "lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts) -- calls a function defined in TODO: new path
-- keymap("n", "<leader>gb", "<cmd>:Gitsigns toggle_current_line_blame<CR>", opts)


-- Comment
-- Leader keys to comment ? TODO: maybe remove
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
-- Find additional DAP keybinds in `dapui.lua`
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
-- TODO: plugin setup
-- TODO: maybe remove?
-- keymap("n", "<leader>a", "<cmd>AerialToggle left<cr>", opts) -- toggle symbols panel (aerial)
-- keymap("n", "<leader>gs", ":Telescope aerial<cr>", opts) -- quick goto symbol using telescope

-- Ranger
-- TODO: plugin setup
-- keymap("n", "<leader><leader>", ":RnvimrToggle<cr>", opts)

-- Harpoon
-- TODO: plugin setup
-- h key shows the marks edit window
    -- keymap("n", "<leader>h", "<cmd> lua require'harpoon.mark'.add_file()<cr>", opts)
    -- keymap("n", "<leader>hh", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<cr>", opts)
-- keys 1,2,3,4 and their shift variants are to set and navigate to bookmarks
-- 1!
    -- keymap("n", "<leader>1", "<cmd> lua require'harpoon.ui'.nav_file(1)<cr>", opts)
    -- keymap("n", "<leader>h1", "<cmd> lua require'harpoon.mark'.add_current_file(1)<cr>", opts)
-- 2@
    -- keymap("n", "<leader>2", "<cmd> lua require'harpoon.ui'.nav_file(2)<cr>", opts)
    -- keymap("n", "<leader>h2", "<cmd> lua require'harpoon.mark'.add_current_file(2)<cr>", opts)
-- 3#
    -- keymap("n", "<leader>3", "<cmd> lua require'harpoon.ui'.nav_file(3)<cr>", opts)
    -- keymap("n", "<leader>h3", "<cmd> lua require'harpoon.mark'.add_current_file(3)<cr>", opts)
-- 4$
    -- keymap("n", "<leader>4", "<cmd> lua require'harpoon.ui'.nav_file(4)<cr>", opts)
    -- keymap("n", "<leader>h4", "<cmd> lua require'harpoon.mark'.add_current_file(4)<cr>", opts)

-- Leap