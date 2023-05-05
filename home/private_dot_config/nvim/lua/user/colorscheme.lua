local M = {
    "catppuccin/nvim",
    commit = "a7e279d6e019f35dd042670f00748b602fff5568",
    lazy = false,
    priority = 1000,
}

M.name = "catppuccin"
function M.config()
    require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = false,
        compile = {
            enabled = true,
            path = vim.fn.stdpath "cache" .. "/catppuccin",
        },
        integrations = {
            alpha = true,
            cmp = true,
            gitsigns = true,
            harpoon = true,
            illuminate = true,
            mason = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
            which_key = true,
            -- Special
            dap = {
                enabled = true,
                enable_ui = true,
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
        },
    }
    local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
    if not status_ok then
        return
    end
end

return M
