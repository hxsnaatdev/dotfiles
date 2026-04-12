return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		branch = "regexp", -- Use the latest version
		config = function()
			require("venv-selector").setup({
				settings = {
					options = {
						notify_user_on_venv_activation = true,
					},
				},
			})
		end,
		keys = {
			-- This maps "Space + c + v" to the selector
			{ "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
		},
	},
}
