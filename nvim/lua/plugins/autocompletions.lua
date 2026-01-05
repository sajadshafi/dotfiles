return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        config = function()
            require("blink.cmp").setup({
                -- keymap = { preset = 'default' },
                keymap = {
                    ['<CR>'] = { 'accept', 'fallback' },
                    ['<Tab>'] = { 'select_next', 'fallback' },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                },
                appearance = {
                    use_nvim_cmp_as_default = true,
                    nerd_font_variant = 'mono'
                },
                -- completion = { documentation = { auto_show = false } },
                -- sources = {
                --     default = { 'lsp', 'path', 'snippets', 'buffer' },
                -- },
                -- fuzzy = { implementation = "prefer_rust_with_warning" }
            })
        end
        -- opts_extend = { "sources.default" }
    }
}
