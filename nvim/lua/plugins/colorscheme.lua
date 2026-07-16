local function enable_transparency()
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.cmd(":hi statusline guibg=NONE")
end

return {
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
                background = "medium",       -- soft | medium | hard
                transparent_background_level = 2,
                italics = true,
                disable_italic_comments = false,
                ui_contrast = "low",         -- dim, easy on the eyes
            })
            vim.cmd.colorscheme("everforest")
            enable_transparency()
        end
    }
}
