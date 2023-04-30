local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    return
end

-- Available LSP servers
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
local servers = {
    "angularls",
    "ansiblels",
    "astro",
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "cssmodules_ls",
    "dagger",
    "diagnosticls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "grammarly",
    "graphql",
    "html",
    "jsonls",
    "prismals",
    "pylsp",
    "rnix",
    "sqlls",
    "lua_ls",
    "svelte",
    "tailwindcss",
    "taplo",
    "terraformls",
    "tflint",
    "tsserver",
    "vimls",
    "volar",
    "yamlls",
    -- "asm_lsp",
    -- "awk_ls",
    -- "denols",
    -- "hls",
    "rust_analyzer",
}

mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = servers,

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }
    local has_custom_opts, custom_opts = pcall(require, "user.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, custom_opts)
    end
    lspconfig[server].setup(opts)
end
