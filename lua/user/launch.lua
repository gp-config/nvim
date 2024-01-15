LAZY_PLUGIN_SPEC = {}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

function colorscheme(item)
  local active_variant = item.variants.active
  item.variants = nil

  table.insert(LAZY_PLUGIN_SPEC, item)

  return active_variant
end
