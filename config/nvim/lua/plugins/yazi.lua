return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>fy", "<cmd>Yazi<cr>",     desc = "Open Yazi in current file" },
			{ "<leader>fY", "<cmd>Yazi cwd<cr>", desc = "Open Yazi in current directory" },
		},
		opts = {
			open_for_directories = false,
			keymaps = { show_help = "<f1>" },
			yazi_floating_window_border = "none",
		},
	},
}
