--Project directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Compile Java
vim.keymap.set("n", "<leader>cf", vim.cmd.JdtCompile)

--Tabs
vim.keymap.set("n", "<leader>tN", vim.cmd.tabnew, {desc = "Open a new Tab"})
vim.keymap.set("n", "<leader>tC", vim.cmd.tabclose, {desc = "Close current tab"})
vim.keymap.set("n", "<leader>tl", "<cmd>Telescope telescope-tabs list_tabs<cr>" , {desc = "Tab List"})

--Finding
vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", {desc = "Find File"})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Search"})
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope grep_string<cr>", {desc = "Search hovered word"})
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", {desc = "Find references (LSP)"})

--Trouble
vim.keymap.set("n", "<leader>tt", vim.cmd.TroubleToggle, {desc = "Toggle Trouble"})
vim.keymap.set("i", "<C-t>", vim.cmd.TroubleToggle, {desc = "Toggle Trouble"})
vim.keymap.set("n", "<leader>tne", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", {desc = "Go to next Error"})
vim.keymap.set("n", "<leader>tpe", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", {desc = "Go to previous error"})

--Undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, {desc = "Toggle Undotree"})
vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus, {desc = "Focus Undotree"})

--Java Maven stuff maybe I can come up with something similar but for gradle
local function get_spring_boot_runner(profile, debug)
    local debug_param = ""
    if debug then
        debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket, server=y,suspend=y,address=5005"'
    end

    local profile_param = ""
    if profile then
        profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
    end

    return "mvn spring-boot:run " .. profile_param .. debug_param
end

local function run_spring_boot(debug)
    vim.cmd('2TermExec cmd="' .. get_spring_boot_runner("local", debug) .. '"')
end

vim.keymap.set("n", "<F9>", function() run_spring_boot() end)
vim.keymap.set("n", "<F10>", function() run_spring_boot(true) end)

