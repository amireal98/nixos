vim.keymap.set("n", "<leader>qd", vim.cmd.Dashboard)

return {
	"nvimdev/dashboard-nvim",
	lazy = false,
	opts = function()
		local logo = [[
⣿⣿⣿⡿⢠⣿⠀⣾⣿⣿⣿⣿⣿⣿⣇⠘⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣾⣿⣿⣿⣿⣿⣿⣿⡏⢸
⣿⡿⠟⣁⣤⣤⣤⣉⡉⠀⢸⣿⣿⣿⣿⡆⢻⡿⠟⢛⣉⣡⣤⣤⣠⣤⣤⣌⣉⠛⢿⠏⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣾
⡟⢀⣾⣿⣿⣿⣿⣿⣷⡀⠀⠛⠛⠋⣉⣁⣈⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣈⣀⠛⠛⠛⠉⣿⣿⣿⣿⣿⡿⠃⣴⣿
⡇⣺⣿⣿⣿⣿⣿⣿⣿⣷⡀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⣰⣿⣿⣿⣿⡟⢁⣼⣿⣿
⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢰⣿⣿⣿⣿⣿⣿⣿⡏⢹⣿⣿⣿⠟⢿⣿⣿⣿⣿⣿⣿⣿⣧⣈⠙⢿⣿⠿⠋⣴⣿⣿⣿⣿
⣇⠈⠿⣿⣿⣿⣿⣿⡿⠟⢀⣾⣿⣿⣿⣿⣿⠿⠿⠇⠘⣿⣿⡇⢠⣄⠙⢉⣛⡋⠛⢿⣿⣿⣿⣷⠀⢁⣴⣾⣿⣿⣿⣿⣿
⣿⣷⣦⣄⣉⣉⣉⣉⡄⠀⣤⣼⣿⣿⣿⠟⢁⣴⣦⣴⡄⠹⣿⡇⣿⣿⣴⠟⠛⠿⣷⣄⠙⢿⣿⣿⣇⠘⠋⢻⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠟⠁⠠⠿⠛⢻⣿⣿⠃⣰⣿⡿⠁⣤⠈⢤⣈⠁⣿⣿⡏⢠⣿⣆⠈⣿⣧⠈⢿⣿⣿⠖⠁⣼⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣶⣶⣶⠀⢸⣿⡟⠋⢰⣿⣿⡇⢨⣿⡇⢸⣿⣿⣿⣿⣇⠘⣿⣿⠇⣿⣿⢰⣤⣀⣠⡴⠀⣸⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠈⢻⠇⡄⢸⣿⣿⣿⡈⠛⢀⡾⠛⠛⢻⣿⣿⣧⣬⣥⣴⣿⠏⣸⣿⡟⠋⣠⣾⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢴⣦⣄⡧⠈⠁⣼⣿⣿⣿⣿⣷⣶⣶⣿⣿⣿⣿⣿⣿⣿⣁⣄⣠⣿⣷⠀⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡌⢻⣧⣴⣶⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⠿⠟⢉⡉⠛⠇⢸⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠘⢁⣈⠛⠿⠿⠿⣿⣿⣿⣧⣴⣤⣿⣿⣿⡉⠁⣀⠒⠲⡿⠛⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠐⠟⠻⡏⠠⣤⣶⣶⡄⠈⠛⠻⣿⣿⣿⡿⠁⣼⣿⡿⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⡦⢌⣀⡈⣿⣿⣷⣄⠀⠾⡿⠟⢋⣠⣾⣿⣿⣇⡘⢻⡟⢀⠙⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣌⠙⠀⠿⣿⣿⣿⣷⣶⣶⣶⣿⣿⣿⣿⠏⠉⢠⡀⠠⣾⣷⡀⢻⣿⣿⣿⣿⣿⣿
do you the space and the stars, don't you?
		]]

		logo = string.rep("\n", 1) .. logo .. "\n\n"

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),

				center = {
					{ action = function() vim.cmd("Telescope find_files") end, desc = " start coding", icon = " ", key = "f" },
					{ action = function() vim.cmd("Lazy") end, desc = " my plugins", icon = "󰒲 ", key = "l" },
					{ action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " goodbye", icon = " ", key = "q" },
				},
			},
		}
		-- open dashboard after closing lazy
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end

		return opts
	end,
}
