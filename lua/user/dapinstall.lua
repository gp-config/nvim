local M = {
  "ravenxrz/DAPInstall.nvim",
  commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
  event = "VeryLazy",
}

function M.config()
  local dap_install = require "dap-install"

  dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  }

  dap_install.config("python", {})
  dap_install.config("codelldb", {})
end

return M
