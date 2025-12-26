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
				configure = true,
				config = {
					os = { editPreset = "nvim-remote" },
					gui = {
						nerdFontsVersion = "3",
					},
				},
				win = { style = "Lazygit" },
				theme = {
					[241]                      = { fg = "Special" },
					activeBorderColor          = { fg = "MatchParen", bold = true },
					cherryPickedCommitBgColor  = { fg = "Identifier" },
					cherryPickedCommitFgColor  = { fg = "Function" },
					defaultFgColor             = { fg = "Normal" },
					inactiveBorderColor        = { fg = "FloatBorder" },
					optionsTextColor           = { fg = "Function" },
					searchingActiveBorderColor = { fg = "MatchParen", bold = true },
					selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
					unstagedChangesColor       = { fg = "DiagnosticError" },
				},
			},
		},

		keys = {
			{ "<leader>gp", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "Github Pull Requests" }, -- github
		},
	},
}
