# gp :: nvim config

Built on [launch.nvim](https://github.com/LunarVim/Launch.nvim/tree/master) by the LunarVim team

Uses the [lazy.nvim](https://github.com/folke/lazy.nvim) package manager by folke

---

Syntax highlighting for languages are provided by treesitter grammars.

Completion features are provided by LSP servers. They're managed by `nvim-lspconfig`.

---

#### init flow

- `init.lua` is loaded by nvim, which `require`s some stuff (including an important function called `spec`)
- `init.lua` runs `spec` for a bunch of plugins,
  - (plugins are listed as lua module names)
  - this builds us a table of plugin modules to import - they're all added to the `LAZY_PLUGIN_SPEC` global variable
- `init.lua` loads the `user.lazy` module
- `user.lazy` installs `lazy.nvim` package manager and runs its setup function, passing the `LAZY_PLUGIN_SPEC` global variable

When `lazy.nvim` setup runs, this is roughly what the `LAZY_PLUGIN_SPEC` table looks like:

```lua
{
  { import = "user.colorscheme" },
  { import = "user.devicons" },
  { import = "user.treesitter" },
  { import = "user.mason" },

  -- ... etc
}
```

`lazy.nvim` will import and integrate each plugin module in that table.

Each of those plugin modules represents a table of `lazy.nvim` options.

Sometimes those plugin modules also have a `setup` method associated with them, which is run automatically by `lazy.nvim`.

---

### #HOWTO: Reset configuration

here's how to clear out the nvim config cache, re-installing and re-configuring all plugins

1. Delete `~/.local/share/nvim`

2. Open neovim

At this point, `lazy.nvim` should install all plugins, and `Mason` should begin downloading all LSP servers, formatters, etc.

### #HOWTO: Install a new LSP server

here's how to install e.g. `astro`;

1. Run `mason`

```
:Mason
```

2. Search the LSP tab for `astro`

3. Press `enter` to open the selected line, and read about the package

4. Press `i` to install the language server

### #HOWTO: Add an LSP to the default configuration

here's how to ensure that nvim will install an LSP server on startup (if it's not already installed)

- open the `user/lspconfig.lua` file
- find the `ensure_installed` block
- add a line for the LSP

e.g. adding astro - this installs [withastro/language-tools](https://github.com/withastro/language-tools)

```diff
  local ensure_installed = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
+   "astro",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "tailwindcss",
    "elixirls",
    "rust_analyzer",
  } -- put the language you want in this table
```

### #HOWTO: Install a new tree-sitter grammar

here's how to install e.g. `astro`;

this installs [virchau13/tree-sitter-astro](https://github.com/virchau13/tree-sitter-astro) using the `TSInstall` command.

```
:TSInstall astro
```

### #HOWTO: Add a tree-sitter grammar to the default configuration

here's how to ensure that nvim will install a tree-sitter grammar on startup (if it's not already installed)

- open the `user/treesitter.lua` file
- find the `ensure_installed` block
- add a line for the grammar

e.g. adding astro - this installs [virchau13/tree-sitter-astro](https://github.com/virchau13/tree-sitter-astro)

```diff
  ensure_installed = {
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "python",
    "rust",
    "elixir",
    "heex",
    "eex",
+   "astro",
  }, -- put the language you want in this table
```

---

recent keybinds:

- `<leader>s<right | left>` - swap current argument left or right

---

<details>
<summary>does not work:</summary>
- in neovide,
    - highlighting a bunch of text (e.g. inside "") and pasting from system clipboard `"+p`
</details>

<details>
<summary>TODO</summary>

- [ ] install that plugin which lets you set a specific color scheme per language | [link](https://github.com/folke/styler.nvim)
- [ ] set default theme for `.lua` files to `lunaperche`
  - it's installed by default in vim and looks pretty good for lua
  - makes a good theme for nvim config editing
- [ ] switch from null-ls to none-ls
- [ ] make a `snippet or cmp plugin or none-ls plugin` to show an autocomplete dropdown for all the supported keys in `user.todo-comments`
- [ ] project-specific settings
  - each project should be able to specify its own settings file that neovim loads when the repo is opened
  - the intent is mainly for LSP settings right now;
    - e.g. provide a sub-directory to elixir's LSP projectDir setting
    - e.g. provide rust-analyzer options for false-positive dead client/server code in a leptos project
- [ ] when a new buffer is opened that isn't already in the buffer list, cleanup old buffers past a certain limit (maybe 25 buffers?)
- [ ] is there a way to trigger code actions from inside the Trouble window?
- [ ] could we add a cli argument to lazygit, allowing us to open lazygit from nvim and automatically select the active nvim file in the lazygit file tree?
- [ ] try out [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [ ] try out [edluffy/specs.nvim](https://github.com/edluffy/specs.nvim)
- [ ] re-add [lspkind](https://github.com/onsails/lspkind.nvim) to cmp
- [ ] try out [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [ ] use ~~ranger~~ yazi as filebrowser by default, but fall back to triptych when not available
- [ ] try mini.completion instead of nvim-cmp
  - it seems to have debounce settings out of the box, and may be async? (cmp doesn't really feel like it's async)

</details>
