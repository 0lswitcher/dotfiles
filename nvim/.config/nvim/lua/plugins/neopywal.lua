return {
  "RedsXDD/neopywal.nvim",
  name = "neopywal",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("neopywal").setup()
    vim.cmd.colorscheme("neopywal")
  end,
}
