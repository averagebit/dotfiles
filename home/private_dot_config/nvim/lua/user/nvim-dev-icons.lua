local M = {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    commit = "986875b7364095d6535e28bd4aac3a9357e91bbe",
}

function M.config()
    require("nvim-web-devicons").setup({
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh",
            },
        },
        color_icons = true,
        default = true,
    })
end

return M
