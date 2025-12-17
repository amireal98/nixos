return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  depencencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", vim.cmd.LazyGit, desc = "Open lazygit" },
  },
}
