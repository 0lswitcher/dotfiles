return {
  {
    "MaximilianLloyd/ascii.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      local ascii = require("ascii")

      -- telescope integration
      require("telescope").load_extension("ascii")

      -- keymaps
      vim.keymap.set("n", "<leader>ap", function()
        ascii.preview()
      end, { desc = "ASCII Preview" })

      vim.keymap.set("n", "<leader>at", "<cmd>Telescope ascii<CR>", {
        desc = "ASCII Telescope",
      })
    end,
  },

  -- modify LazyVim's existing snacks config
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local ascii = require("ascii")

      -- choose art
      local header = ascii.art.text.neovim.sharp
      -- local header = ascii.art.text.doom.MF_DooM_graffiti

      -- OR random:
      -- local header = ascii.get_random_global()

      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}

      opts.dashboard.preset.header = table.concat(header, "\n")
    end,
  },
}
