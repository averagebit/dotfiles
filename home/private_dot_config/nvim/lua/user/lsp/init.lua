local ok, _ = pcall(require, "lspconfig")
if not ok then
    return
end

require("user.lsp.mason")
require("user.lsp.cfg")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
