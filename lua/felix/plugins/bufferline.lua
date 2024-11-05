return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                mode = "tabs",
                themable = true,
                numbers = "none",
                indicator = {
                    style = "underline",
                },
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                auto_toggle_bufferline = true,
            }
        })
    end
}
