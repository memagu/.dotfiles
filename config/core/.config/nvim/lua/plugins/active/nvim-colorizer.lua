return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    user_default_options = {
      names_opts = { uppercase = true },
      css = true,
      tailwind = true,
      tailwind_opts = { update_names = true },
      sass = { enable = true, parsers = { "css" } },
      mode = "virtualtext",
      virtualtext = "󱓻",
      virtualtext_inline = "before",
    },
  },
}
