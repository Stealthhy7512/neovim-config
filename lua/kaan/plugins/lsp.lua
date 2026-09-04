return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
	},

	{
		"mason-org/mason-lspconfig.nvim",

		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},

		opts = {
			ensure_installed = {
				"lua_ls",
				-- TypeScript / JavaScript
				"vtsls",
				"svelte",
				"kotlin_lsp",
				"clangd",
				-- Python
				"basedpyright",
				"gopls",
			},

			automatic_enable = true,
		},

		config = function(_, opts)
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Lua / Neovim configuration
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},

						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},

						diagnostics = {
							globals = { "vim" },
						},

						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- TypeScript / JavaScript
			vim.lsp.config("vtsls", {
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = {
								enabled = "literals",
							},
							parameterTypes = {
								enabled = true,
							},
							variableTypes = {
								enabled = true,
							},
							propertyDeclarationTypes = {
								enabled = true,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
							enumMemberValues = {
								enabled = true,
							},
						},
					},

					javascript = {
						inlayHints = {
							parameterNames = {
								enabled = "literals",
							},
							parameterTypes = {
								enabled = true,
							},
							variableTypes = {
								enabled = true,
							},
							propertyDeclarationTypes = {
								enabled = true,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
							enumMemberValues = {
								enabled = true,
							},
						},
					},
				},
			})

			-- Svelte
			vim.lsp.config("svelte", {})

			-- Kotlin
			vim.lsp.config("kotlin_lsp", {})

			-- C / C++
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
				},
				init_options = {
					fallbackFlags = { "-std=c++23" },
				},
			})

			-- Python
			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							autoSearchPaths = true,
						},
					},
				},
			})

			-- Go
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,

						analyses = {
							unusedparams = true,
							shadow = true,
						},

						staticcheck = true,

						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			require("mason-lspconfig").setup(opts)
		end,
	},

	{
		"j-hui/fidget.nvim",

		opts = {},
	},
}
