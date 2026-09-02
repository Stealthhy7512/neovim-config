vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = -1
		vim.opt_local.expandtab = true
	end,
})

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "100"

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	underline = true,
	severity_sort = true,
})
