vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fd", vim.cmd.Explore, { desc = 'Explorer' })

vim.keymap.set("n", "<leader>qa", vim.cmd.qa,      { desc = 'Quit all' })
vim.keymap.set("n", "<leader>qq", vim.cmd.q,      { desc = 'Quit'})
