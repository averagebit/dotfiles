local M = {
    "neovim/nvim-lspconfig",
    commit = "e49b1e90c1781ce372013de3fa93a91ea29fc34a",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
    keymap(
        bufnr,
        "n",
        "<leader>la",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>lj",
        "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
        opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>lk",
        "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
        opts
    )
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(
        bufnr,
        "n",
        "<leader>ls",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts
    )
    keymap(
        bufnr,
        "n",
        "<leader>lq",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        opts
    )
end

M.on_attach = function(client, buf)
    lsp_keymaps(buf)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.name == "sumneko_lua" then
        client.server_capabilities.documentFormattingProvider = false
    end

    lsp_keymaps(buf)
end

function M.common_capabilities()
    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
        return cmp_nvim_lsp.default_capabilities()
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }

    return capabilities
end

function M.config()
    local lspconfig = require("lspconfig")
    local icons = require("user.icons")

    local diagnostic_config = {
        signs = {
            active = true,
            values = {
                {
                    name = "DiagnosticSignError",
                    text = icons.diagnostics.Error,
                },
                {
                    name = "DiagnosticSignWarn",
                    text = icons.diagnostics.Warning,
                },
                { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
                {
                    name = "DiagnosticSignInfo",
                    text = icons.diagnostics.Information,
                },
            },
        },
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(diagnostic_config)

    for _, sign in
        ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {})
    do
        vim.fn.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = sign.name }
        )
    end

    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            width = 60,
        })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
            width = 60,
        })

    for _, server in pairs(require("user.lsp.servers")) do
        local opts = {
            on_attach = M.on_attach,
            capabilities = M.common_capabilities(),
        }

        local require_ok, settings =
            pcall(require, "user.lsp.configs" .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        lspconfig[server].setup(opts)
    end
end

return M
