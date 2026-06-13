return {
  "folke/twilight.nvim",
  opts = {
    dim = 0.5, -- the amount of dimming (between 0 and 1)
    context = 10, -- number of lines of context to show around visible lines
    treesitter = false,
  },
  -- Lazy-load the plugin when you use the commands or keymaps
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  keys = {
    { "<leader>t", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  },
}
