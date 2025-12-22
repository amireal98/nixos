return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autotage = { enable = true },
			ensure_installed = {
				"lua",
				"vim",
				"bash",
				"nix",
				"c",
				"cmake",
				"fish",
				"gitignore",
				"css",
				"markdown",
				"rasi",
			},
			auto_install = false,
		})
	end
}
