local which_key_ok, which_key = pcall(require, "which-key")
if not which_key_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<CR>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["a"] = { "<cmd>Alpha<CR>", "Alpha" },
    ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
        "Buffers",
    },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
    ["o"] = { "<cmd>e#<CR>", "Open Last File" },
    ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon 1" },
    ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon 2" },
    ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon 3" },
    ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon 4" },
    ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Harpoon 5" },
    ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", "Harpoon 6" },
    ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", "Harpoon 7" },
    ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", "Harpoon 8" },
    ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<CR>", "Harpoon 9" },
    ["0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<CR>", "Harpoon 10" },

    n = {
        name = "Notes",
        s = { "<cmd>e $NOTES/Scratchpad/Scratchpad.md<CR>", "Scratchpad" },
    },

    k = {
        name = "Harpoon",
        n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next" },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Prev" },
        m = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add" },
        j = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
    },

    m = {
        name = "Packer",
        c = { "<cmd>PackerCompile<CR>", "Compile" },
        i = { "<cmd>PackerInstall<CR>", "Install" },
        s = { "<cmd>PackerSync<CR>", "Sync" },
        S = { "<cmd>PackerStatus<CR>", "Status" },
        u = { "<cmd>PackerUpdate<CR>", "Update" },
    },

    g = {
        name = "Git",
        b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<CR>",
            "Diff",
        },
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
    },

    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        d = {
            "<cmd>Telescope lsp_document_diagnostics<CR>",
            "Document Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<CR>", "Format" },
        i = { "<cmd>LspInfo<CR>", "Info" },
        I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
            "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
            "Workspace Symbols",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<CR>",
            "Workspace Diagnostics",
        },
    },

    f = {
        name = "Telescope",
        b = { "<cmd>Telescope buffers<CR>", "Buffers" },
        c = { "<cmd>Telescope colorscheme<CR>", "Colorschemes" },
        C = { "<cmd>Telescope commands<CR>", "Commands" },
        g = { "<cmd>Telescope git_branches<CR>", "Git Branches" },
        h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
        m = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
        o = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
        r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
        R = { "<cmd>Telescope registers<CR>", "Registers" },
    },

    t = {
        name = "Editor",
        l = { "<cmd>setlocal nolist!<CR>", "Toggle List Mode" },
        n = { "<cmd>setlocal nonumber!<CR><cmd>setlocal rnu!<CR>", "Toggle Numbers" },
        s = { "<cmd>setlocal spell!<CR>", "Toggle Spell Checking" },
        w = {
            "<cmd>execute('setlocal wrap! breakindent! colorcolumn=' . (&colorcolumn == '' ? &textwidth : ''))<CR>",
            "Toggle Wrapping",
        },
    },

    d = {
        name = "Debugger",
        p = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
        i = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
        O = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
        l = { "<cmd>lua require'dap'.run_last()<CR>", "Run Last" },
        t = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate" },
        d = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle Debugger" },
        r = { "<cmd>lua require'dap'.repl.toggle({height = 14})<CR>", "Toggle Repl" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
