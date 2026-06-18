return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.keybinds"] = {
					config = {
						default_keybinds = false,
					},
				},
			},
		})
	end,
}
