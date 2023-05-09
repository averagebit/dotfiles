local M = {
    "rktjmp/paperplanes.nvim",
    commit = "d704b2e1e594b32d454cc7e0c5f2cf9b391e3cc1",
    event = "VeryLazy",
}

function M.config()
    require("paperplanes").setup({
        register = "+",
        provider = "paste.rs",
        provider_options = {},
        notifier = vim.notify or print,
    })
end

return M
