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

-- Save files with ctrl-s
keymap("n", "<C-s>", ":w<CR>", opts)

-- window navigation
keymap("n", "<leader>v", "<C-w>v<C-w>h") -- vertical window split
-- keymap("n", "<leader>v", ":60 vsplit <CR><C-w>h", { silent = true }) -- vertical window split
keymap("n", "<leader>sh", "<C-w>s") -- horizontal window split
keymap("n", "<leader>c", ":close<CR>", { silent = true })
keymap("n", "<leader>w<Left>", "<C-w>h")
keymap("n", "<leader>w<Down>", "<C-w>j")
keymap("n", "<leader>w<Up>", "<C-w>k")
keymap("n", "<leader>w<Right>", "<C-w>l")
keymap("n", "=", ":wincmd =<CR>")

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

-- NOTE: deprecated :: trying to discourage use of these keys for naviagion!
--       Jump to next empty line (the { and } keys) also should scroll
--       keymap("n", "}", "}zz", { noremap = true })
--       keymap("n", "{", "{zz", { noremap = true })
--
--       unmap those buttons:
keymap("n", "}", "")
keymap("n", "{", "")

-- NOTE: favor movement style:
--       pageup & pagedown:
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

--       Initially set pageup & pagedown size (% of screen):
--        NOTE: doesn't work
-- vim.cmd [[:let key = nvim_replace_termcodes("1<C-u>", v:true, v:false, v:true)]]
-- vim.cmd [[:call nvim_feedkeys(key, 'n', v:false)]]

-- NOTE: favor movement style:
--       jump to next pair of braces
--        NOTE: these don't work too well in elixir.
--              maybe replace with: https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#text-objects-move
keymap("n", "]]", "]]zz", { noremap = true })
keymap("n", "[[", "[[zz", { noremap = true })
keymap("n", "]m", "]mzz", { noremap = true })
keymap("n", "[m", "[mzz", { noremap = true })
keymap("n", "]M", "]Mzz", { noremap = true })
keymap("n", "[M", "[Mzz", { noremap = true })

-- Search jumping should also scroll
keymap("n", "n", "nzz", { noremap = true })
keymap("n", "N", "Nzz", { noremap = true })
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

-- Toggle search highlighting on/off with <Leader>x
vim.cmd [[:nnoremap <silent><expr> <Leader>x (&hls && v:hlsearch ? ':set nohls' : ':set hls')."\n"]]

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
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts) -- live_grep also bound to a different combination in whichkey.lua
keymap("n", "<leader>gf", ":Telescope find_files<CR>", opts) -- find_files also bound to a different combination in whichkey.lua
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)

-- Git
keymap("n", "lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts) -- calls a function defined in toggleterm.lua
keymap("n", "<leader>gb", "<cmd>:Gitsigns toggle_current_line_blame<CR>", opts)

-- No Neck Pain
-- Find NNP keybinds in `noneckpain.lua`

-- Comment

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

-- Navbuddy
keymap("n", "<leader>a", "<cmd>Navbuddy<cr>", opts) -- toggle symbols panel (aerial)

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

keymap("n", "<C-CR>", "lua cmp.complete({reason = cmp.ContextReason.Auto})", opts)
