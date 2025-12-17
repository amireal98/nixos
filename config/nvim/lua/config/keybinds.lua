vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fd", vim.cmd.Explore, { desc = 'Explorer' })
vim.keymap.set("n", "<leader>qq", vim.cmd.qa, { desc = 'Exit' })
