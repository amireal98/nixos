return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			indent = { enabled = true },
			scroll = { enabled = true },
			gh = { enabled = true },

			lazygit = {
				enabled = true,
			},
		},

		keys = {
			{ "<leader>gp", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "Github Pull Requests" }, -- github
		},
	},
}
