--Nightfox
return {
    "EdenEast/nightfox.nvim"
}

--Tokyonight
--[[ return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night",
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = false },
                sidebars = "dark",
                floats = "dark",
            },
            cache = true,
        })
    end
} ]]

--Monokai
--[[ return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup({
            filter = "pro",
            plugins = {
                bufferline = {
                    underline_selected = true,
                    underline_visible = false,
                },
                indent_blankline = {
                    context_highlight = "pro", -- default | pro
                    context_start_underline = false,
                },
            }
            })
    end
} ]]
