-- availble options for rust-analyzer: https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc 
return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        -- leptos SSR gist - https://gist.github.com/GeordieP/07ad21a714f98deda71a9ea4330caef1
        features = {"ssr", "hydrate"}
      }
    }
  }
}
