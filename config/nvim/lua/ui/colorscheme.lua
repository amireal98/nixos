return {
  {
    'metalelf0/black-metal-theme-neovim',
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- options here
        theme = "immortal",
        transparent = true,
      })
      require("black-metal").load()
    end,
  },
}
