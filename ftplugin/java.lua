local status, jdtls = pcall(require, "jdtls")
if not status then
    return
end

--Setup Workspace
local home = os.getenv "USERPROFILE"
local workspace_path = "E:/JavaWorkspace"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

--Determine OS
local os_config = "win"
if vim.fn.has "linux" == 1 then
    os_config = "linux"
elseif vim.fn.has "mac" == 1 then
    os_config = "mac"
end

--Setup Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditSupport = true

--Setup Test and Debug
local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason")

vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "/packages/jdtls/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar"), "\n"))
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "/packages/jdtls/vscode-java-test/server/*.jar"), "\n"))

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.glob(home .. "/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        home .. "/AppData/Local/nvim-data/mason/packages/jdtls/config_" .. os_config,
        "-data",
        workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "grdlew", "pom.xml", "build.gradle" },
    capabilities = capabilities,

    settings = {
        java = {
            ecilpse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "C:/Program Files/Java/jdk-17",
                    },
                    {
                        name = "JavaSE-18",
                        path = "C:/Program Files/Java/jdk-18.0.1.1",
                    },
                    {
                        name = "JavaSE-21",
                        path = "C:/Program Files/Java/jdk-21",
                    },
                },
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all",
                },
            },
            format = {
                enabled = false,
            },
        },
        signaturehelp = {enabled = true},
        extendedClientCapabilities = extendedClientCapabilities,
    },
    init_options = {
        bundles = bundles
    },
}

config['on_attach'] = function(client, bufnr)
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

require("jdtls").start_or_attach(config)

