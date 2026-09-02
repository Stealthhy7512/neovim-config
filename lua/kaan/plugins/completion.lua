return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        opts = {
            keymap = {
                preset = "default",

                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-y>"] = { "accept", "fallback" },
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },

        opts_extend = {
            "sources.default",
        },
    },
}
