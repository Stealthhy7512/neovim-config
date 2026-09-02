return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "frappe",
		transparent_background = true,

		integrations = {
			treesitter = true,
			telescope = {
				enabled = true,
			},
			trouble = true,
			native_lsp = {
				enabled = true,
			},
		},
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
