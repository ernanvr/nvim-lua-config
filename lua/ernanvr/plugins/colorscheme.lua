return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				integrations = {
					barbar = true,
				},
			})
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
}
