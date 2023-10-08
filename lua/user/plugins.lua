local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim"} -- Have packer manage itself
  use { "nvim-lua/plenary.nvim"} -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs"} -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim"}
  use { "JoosepAlviste/nvim-ts-context-commentstring"}
  use { "kyazdani42/nvim-web-devicons"}
  use { "moll/vim-bbye"}
  use { "nvim-lualine/lualine.nvim"}
  use { "akinsho/toggleterm.nvim"}
  use { "lewis6991/impatient.nvim"}
  use { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {
    char = "▏",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "packer",
      "NvimTree",
    },
  }}
  use { "shortcuts/no-neck-pain.nvim"}

  -- Misc
  use { "folke/which-key.nvim"}
  use { "laytan/cloak.nvim"}
  use { "windwp/nvim-ts-autotag"} -- auto close and auto rename html tags (depends on treesitter)
  use { "mg979/vim-visual-multi"} -- multiple cursors (suck it, vim purists)
  use { "stevearc/aerial.nvim"} -- code outline view
  use { "kevinhwang91/rnvimr"} -- file browsing (using ranger; relies on system ranger install)

  -- Movement
  use { "ggandor/leap.nvim"}
  use { "GeordieP/harpoon"}
  -- use { "~/github/geordiep/harpoon/" }
  -- use { "theprimeagen/harpoon", commit = "f2bd3fb552ab45735ad3225e9486612e6e8bfe24" }

  -- Colorschemes
  use { "folke/tokyonight.nvim"}
  use { "lunarvim/darkplus.nvim"}
  use { "shaunsingh/oxocarbon.nvim"}
  use { "catppuccin/nvim"}
  use { "sainnhe/gruvbox-material"}
  use { "sainnhe/everforest"}
  use { "savq/melange-nvim"}
  use { "gp-themes/oxographene.nvim" }
  use { "mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" }

  -- inline color highlighting for hex codes, rgba, etc
  use { "norcalli/nvim-colorizer.lua"}

  -- cmp plugins
  use { "hrsh7th/nvim-cmp"} -- The completion plugin
  use { "hrsh7th/cmp-buffer"} -- buffer completions
  use { "hrsh7th/cmp-path"} -- path completions
  use { "saadparwaiz1/cmp_luasnip"} -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp"}
  use { "hrsh7th/cmp-nvim-lua"}

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine

  -- LSP
  use { "neovim/nvim-lspconfig"} -- enable LSP
  use { "williamboman/mason.nvim"}
  use { "williamboman/mason-lspconfig.nvim"}
  use { "jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
  use { "RRethy/vim-illuminate"}

  -- Telescope
  use { "nvim-telescope/telescope.nvim"}
  use { "nvim-telescope/telescope-fzf-native.nvim"}

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter"}

  -- Git
  use { "lewis6991/gitsigns.nvim"}

  -- DAP
  use { "mfussenegger/nvim-dap"}
  use { "rcarriga/nvim-dap-ui"}
  use { "ravenxrz/DAPInstall.nvim"}

  -- Fennel support
  use { "rktjmp/hotpot.nvim"}

  -- Lua REPL for plugin dev
  use { "bfredl/nvim-luadev"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
