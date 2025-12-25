return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			indent = { enabled = true },
			scroll = { enabled = true },

			animate = {
				---@type snacks.animate.Config
				---@field easing? snacks.animate.easing|snacks.animate.easing.Fn
				{
					---@type snacks.animate.Duration|number
					duration = 20,
					easing = "linear",
					fps = 62,
				},
			},
		},
	},
}
