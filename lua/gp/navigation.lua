local M = {}

local util = {
  -- INFO: make a temporary buffer for the debug output.
  --       returns the buffer
  make_debug_split = function(name, text)
    local split_string = function(inputstr, sep)
      if sep == nil then
        sep = "%s"
      end
      local t = {}
      for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
      end
      return t
    end

    local temp_buf_nr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(temp_buf_nr, name)
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, temp_buf_nr)
    local lines = split_string(text, "\n")
    vim.api.nvim_buf_set_lines(temp_buf_nr, 0, -1, false, lines)
    return temp_buf_nr
  end,
}

-- ======================= --

function M.setup(_opts)
  print "[gp.navigation].setup error: not implemented"
end

function M.list_superclass()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/implementation", params, function(err, result, ctx, config)
    -- ERROR: - generic
    if err then
      print("[gp.navigation].list_superclass error:", err)
      return
    end

    -- ERROR: - when the request returns an empty result
    if not result or vim.tbl_isempty(result) then
      print "[gp.navigation].list_superclass error: no superclass found"
      return
    end

    -- INFO: write debug data to the temporary debug buffer
    local location = result[1]
    local text = vim.inspect(location)
    local temp_buf_nr = util.make_debug_split("[gp.navigation] DEBUG BUFFER", text)
  end)

  -- NOTE: tried this request type as well, but it didn't work.
  -- vim.lsp.buf_request(0, "textDocument/prepareCallHierarchy", params, function(err, result, ctx, config))
end

return M
