return {
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            -- In your neovim config (e.g., init.lua or nvim/init.lua)
            require("conform").setup({
                formatters_by_ft = {
                    svelte = { "prettier" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    json = { "prettier" }
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end
    }
}
