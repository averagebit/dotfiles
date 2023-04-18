local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
    return
end

local lsp = {}

lsp.capabilities = vim.lsp.protocol.make_client_capabilities()

function lsp.illuminate(client)
    local illuminate_ok, illuminate = pcall(require, "illuminate")
    if not illuminate_ok then
        return
    end
    illuminate.on_attach(client)
end

function lsp.keymaps(buf)
    local map = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }
    map(buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map(buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map(buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map(buf, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map(buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map(buf, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

local M = {}

M.capabilities = cmp_nvim_lsp.update_capabilities(lsp.capabilities)

function M.setup()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local cfg = {
        virtual_text = false,
        signs = {
            active = signs,
        },
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

    vim.diagnostic.config(cfg)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 60,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        width = 60,
    })
end

function M.on_attach(client, buf)
    lsp.keymaps(buf)
    lsp.illuminate(client)
end

return M
