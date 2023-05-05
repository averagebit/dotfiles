local M = {
    "williamboman/mason.nvim",
    commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
            lazy = true,
        },
    },
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

function M.config()
    require("mason").setup(settings)
    require("mason-lspconfig").setup({
        ensure_installed = require("utils").servers,
        automatic_installation = true,
    })
end

return M
