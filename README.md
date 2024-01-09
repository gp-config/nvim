# gp :: nvim config

Built on [launch.nvim](https://github.com/LunarVim/Launch.nvim/tree/master) by the LunarVim team

Uses the [lazy.nvim](https://github.com/folke/lazy.nvim) package manager by folke

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

# TODO

- [ ] install that plugin which lets you set a specific color scheme per language
- [ ] set default theme for `.lua` files to `lunaperche`
    - it's installed by default in vim and looks pretty good for lua
    - makes a good theme for nvim config editing
