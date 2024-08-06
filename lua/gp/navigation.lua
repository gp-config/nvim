local M = {}

local util = {
  -- INFO: make a temporary buffer for the debug output.
  --       returns the buffer
  make_debug_split = function(name)
    local temp_buf_nr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(temp_buf_nr, name)
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, temp_buf_nr)
    return temp_buf_nr
  end,

  split_string = function(inputstr, sep)
    if sep == nil then
      sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
      table.insert(t, str)
    end
    return t
  end,
}

-- ======================= --

function M.setup(_opts)
  print "[gp.navigation].setup error: not implemented"
end

function M.list_superclass()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/implementation", params, function(err, result, ctx, config)
    if err then
      print("[gp.navigation].list_superclass error:", err)
      return
    end

    if not result or vim.tbl_isempty(result) then
      print "[gp.navigation].list_superclass error: no superclass found"
      return
    end

    print "[gp.navigation].list_superclass RESULT:"
    vim.print(result)

    local location = result[1]
    print "[gp.navigation].list_superclass FIRST LOCATION:"
    vim.print(location)

    local temp_buf_nr = util.make_debug_split "[gp.navigation] DEBUG BUFFER"

    -- INFO: write debug data to the temporary debug buffer
    local lines = vim.inspect(location)
    lines = util.split_string(lines, "\n")
    vim.api.nvim_buf_set_lines(temp_buf_nr, 0, -1, false, lines)
  end)
end

return M
