return {
  filetypes = {
    "html",
    "elixir",
    "eelixir",
    "heex",
  },
  init_options = {
    elixir = "html-eex",
    eelixir = "html-eex",
    heex = "html-eex",
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
        },
      },
    },
  },
}
