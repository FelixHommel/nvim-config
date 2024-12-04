return {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- event = "VeryLazy", -- either`LspAttach`or VeryLazy -- !!! this made it not work for me
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
            preset = "modern", -- Can be: "modern", "classic", "minimal", "powerline", ghost", "simple", "nonerdfont", "amongus"
            hi = {
                error = "DiagnosticError",
                warn = "DiagnosticWarn",
                info = "DiagnosticInfo",
                hint = "DiagnosticHint",
                arrow = "NonText",
                background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
                mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB)
            },
            options = {
                -- Show the source of the diagnostic.
                show_source = true,

                -- Use your defined signs in the diagnostic config table.
                use_icons_from_diagnostic = false,

                -- Throttle the update of the diagnostic when moving cursor, in milliseconds.
                -- You can increase it if you have performance issues.
                -- Or set it to 0 to have better visuals.
                throttle = 20,

                -- The minimum length of the message, otherwise it will be on a new line.
                softwrap = 30,

                -- If multiple diagnostics are under the cursor, display all of them.
                multiple_diag_under_cursor = true,

                -- Enable diagnostic message on all lines.
                multilines = true,

                -- Show all diagnostics on the cursor line.
                show_all_diags_on_cursorline = true,

                -- Enable diagnostics on Insert mode. You should also se the `throttle` option to 0, as some artefacts may appear.
                enable_on_insert = false,

                overflow = {
                    mode = "wrap"
                }
            }
        })
        vim.diagnostic.config({ virtual_text = false })
    end
}
