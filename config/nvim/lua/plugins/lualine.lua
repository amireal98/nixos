return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require('lualine').setup {
				options = {
					disabled_filetypes = { statusline = { "dashboard", "snacks_dashboard" } },
					icons_enabled = false,
					theme = "auto",
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = {
						function()
							local encoding = vim.o.fileencoding
							if encoding == "" then
								return vim.bo.fileformat .. " :: " .. vim.bo.filetype
							else
								return encoding .. " :: " .. vim.bo.fileformat .. " :: " .. vim.bo.filetype
							end
						end,

					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			}
		end,
	}
}
