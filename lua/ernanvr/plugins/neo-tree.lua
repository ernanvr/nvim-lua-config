return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "[t", ":Neotree filesystem reveal float<CR>")
		vim.keymap.set("n", "[f", ":Neotree reveal_force_cwd float<CR>")
		require("neo-tree").setup({
			buffers = {
				leave_dirs_open = true,
			},
		})
	end,
}
