local which_key = require("which-key")

--Project directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Tabs
which_key.add({
    { "<leader>t", group = "Tabs" },
    { "<leader>tn", vim.cmd.tabnew, desc = "Open a new buffer" },
    { "<leader>tc", vim.cmd.tabclose, desc = "Close current tab" },
    { "<leader>tl", "<cmd>BufferLineCycleNext<cr>", desc = "Goto next tab" },
    { "<leader>th", "<cmd>BufferLineCyclePrev<cr>", desc = "Goto prev tab" },
    { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
})

--Windows
which_key.add({
    { "<leader>w", group = "Window" },
    { "<leader>wl", "<C-w>l", desc = "Switch to the window to the right" },
    { "<leader>wh", "<C-w>h", desc = "Switch to the window to the left" },
    { "<leader>wj", "<C-w>j", desc = "Switch to the window to the bottom" },
    { "<leader>wk", "<C-w>k", desc = "Switch to the window to the top" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Open a Terminal" },
})

--File operations
which_key.add({
    { "<leader>f",  group = "file" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",     desc = "Find file",                          mode = "n" },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>",      desc = "Live grep",                          mode = "n" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",      desc = "Find git files",                     mode = "n" },
    { "<leader fr", "<cmd>Telescope lsp_references<cr>", desc = "Find references (LSP)",              mode = "n" },
    { "<leader>sf", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch between .cpp and .hpp Files", mode = "n" },
})

--Visual Mode
which_key.add({
    { "J", ":m '>+1<CR>gv=gv", desc = "Move selection down", mode = "v" },
    { "J", ":m '>-2<CR>gv=gv", desc = "Move selection down", mode = "v" },
})

--LSP
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local buf = event.buf

        which_key.add({
            { "g",          group = "Goto" },
            { "gd",         vim.lsp.buf.definition,       desc = "Goto definition",        mode = "n" },
            { "gb",         "<C-o>",                      desc = "Go back to prev position", mode = "n" },
            { "gl",         vim.diagnostic.open_float,    desc = "Open diagnostics float", mode = "n" },
            { "<leader>K",  vim.lsp.buf.hover,            desc = "Show hover info",        mode = "n" },
            { "<leader>l",  group = "LSP" },
            { "<leader>la", vim.lsp.buf.code_action,      desc = "Code Action",            mode = "n" },
            { "<leader>lr", vim.lsp.buf.references,       desc = "Show references",        mode = "n" },
            { "<leader>ln", vim.lsp.buf.rename,           desc = "Rename",                 mode = "n" },
            { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbols",      mode = "n" },
            { "<leader>ld", vim.diagnostic.open_float,    desc = "Open diagnostics float", mode = "n" },
            { "[d",         vim.diagnostic.goto_next,     desc = "Goto next diagnostic",   mode = "n" },
            { "]d",         vim.diagnostic.goto_prev,     desc = "Goto prev diagnostic",   mode = "n" },
            { "<C-h>",      vim.lsp.buf.signature_help,   desc = "Show signature help", mode = "i" },
        }, { buffer = buf })
    end,
})

--Code Fold
which_key.add({
    { "f", group = "Fold" },
    { "fC", require("ufo").openAllFolds, desc = "Open folded code", mode = "n" },
    { "fc", require("ufo").closeAllFolds, desc = "Fold all code", mode = "n" },
    { "fw", "za", desc = "Fold current block", mode = "n" },
})
