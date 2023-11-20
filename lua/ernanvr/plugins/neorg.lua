return {
	"nvim-neorg/neorg",
	-- tag = "*",
	ft = "norg",
	after = "nvim-treesitter", -- You may want to specify Telescope here as well
	run = ":Neorg sync-parsers",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							-- Unmaps any Neorg key from the `norg` mode
							-- keybinds.unmap("norg", "n", "gtd")
							-- keybinds.unmap("norg", "n", keybinds.leader .. "nn")

							-- Sometimes you may simply want to rebind the Neorg action something is bound to
							-- versus remapping the entire keybind. This remap is essentially the same as if you
							-- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR>")
							-- keybinds.remap_event("norg", "n", "<C-b>", "core.qol.todo_items.todo.task_done")

							-- Want to move one keybind into the other? `remap_key` moves the data of the
							-- first keybind to the second keybind, then unbinds the first keybind.
							keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>t")
						end,
					},
				},
			},
		})
	end,
}
