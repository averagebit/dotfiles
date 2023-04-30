local colorscheme = "catppuccin"

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        harpoon = false,
        mason = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
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
        dap = {
            enabled = true,
            enable_ui = true,
        },
    },
})

vim.cmd.colorscheme("catppuccin")
