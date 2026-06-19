return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			vtsls = {},
			nil_ls = {
				settings = {
					["nil"] = {
						formatting = {
							command = { "alejandra" },
						},
					},
				},
			},
		},
	},
}
