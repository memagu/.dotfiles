if vim.loader then
  vim.loader.enable()
end

require("config.set")
require("config.remap")
require("config.autocmds")
require("config.diagnostic")
require("config.lazy")
