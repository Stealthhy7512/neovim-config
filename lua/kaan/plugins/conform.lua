return {
    'stevearc/conform.nvim',

    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },

    keys = {
        {
            '<leader>f',
            function()
                require('conform').format({
                    async = true,
                    lsp_format = 'fallback',
                })
            end,
            mode = { 'n', 'v' },
            desc = 'Format buffer',
        },
    },

    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },

            javascript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            svelte = { "prettierd", "prettier", stop_after_first = true },

            kotlin = { "ktlint" },

            c = { "clang_format" },
            cpp = { "clang_format" },

            python = { "ruff_format" },

            go = { "goimports", "gofmt" },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'fallback',
        },
    },
}
               
