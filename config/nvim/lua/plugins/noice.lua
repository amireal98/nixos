return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			--- options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},

		require("noice").setup({
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
			},
		})
	},
}
