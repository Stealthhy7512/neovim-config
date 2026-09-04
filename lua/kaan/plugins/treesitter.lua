return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        init = function()
            local parsers = {
                'lua',
                'vim',
                'vimdoc',
                'query',

                'c',
                'cpp',
                'python',
                'kotlin',
                'go',

                'javascript',
                'typescript',
                'tsx',

                'html',
                'css',
                'svelte',
                'json',

                'latex',
                'markdown',
                'markdown_inline',
                'bash',
                'yaml',
            }

            local group = vim.api.nvim_create_augroup(
                'Treesitter',
                { clear = true }
            )
            vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' }, {
                group = group,
                callback = function()
                    if vim.bo.buftype ~= '' then
                        return
                    end

                    pcall(vim.treesitter.start, 0)
                end,
            })

            vim.api.nvim_create_autocmd('User', {
                group = group,
                pattern = 'VeryLazy',
                once = true,
                callback = function()
                    require('nvim-treesitter').install(parsers)
                end,
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = false,
        config = function()
            local select = require('nvim-treesitter-textobjects.select')

            require('nvim-treesitter-textobjects').setup({
                select = {
                    lookahead = true,
                    selection_modes = {
                        ['@function.outer'] = 'V',
                    },
                },
            })

            vim.keymap.set({ 'x', 'o' }, 'af', function()
                select.select_textobject('@function.outer', 'textobjects')
            end, { desc = 'Select around function' })

            vim.keymap.set({ 'x', 'o' }, 'if', function()
                select.select_textobject('@function.inner', 'textobjects')
            end, { desc = 'Select inside function' })
        end,
    },
}
