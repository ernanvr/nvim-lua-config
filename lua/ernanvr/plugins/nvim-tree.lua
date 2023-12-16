return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.del("n", "<C-t>", { buffer = bufnr })
			-- vim.keymap.del("n", "<C-]>", { buffer = bufnr })
			vim.keymap.del("n", "<C-x>", { buffer = bufnr })
			vim.keymap.del("n", "<C-v>", { buffer = bufnr })
			vim.keymap.del("n", "x", { buffer = bufnr })
			vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
			-- vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "x", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		end

		local HEIGHT_RATIO = 0.8 -- You can change this
		local WIDTH_RATIO = 0.5 -- You can change this too

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			view = {
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
				side = "right",
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
		-- keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>n", "<cmd>:NvimTreeFocus<CR>")
		keymap.set("n", "[t", "<cmd>:NvimTreeToggle<CR>")
		keymap.set("n", "[f", "<cmd>:NvimTreeFindFile<CR>")
	end,
}
