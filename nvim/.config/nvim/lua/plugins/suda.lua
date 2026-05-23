return {
  "lambdalisue/vim-suda",
  cmd = { "SudaRead", "SudaWrite" },
  config = function()
    -- Optional: set sudo as the default editor
    vim.g.suda_smart_edit = 1
  end,
}
