return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            win = {
              list = {
                keys = {
                  ["<Left>"] = "explorer_close",
                  ["h"] = "explorer_close",
                  ["<Right>"] = "confirm",
                  ["l"] = "confirm",
                },
              },
            },
          },
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
