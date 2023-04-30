local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Plugin Manager
    use({
        "wbthomason/packer.nvim",
        commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530",
    })

    -- Plugin Caching
    use({
        "lewis6991/impatient.nvim",
        commit = "969f2c5c90457612c09cf2a13fee1adaa986d350",
    })

    -- Commond dependency
    use({
        "nvim-lua/plenary.nvim",
        commit = "253d34830709d690f013daf2853a9d21ad7accab",
    })

    -- Colorscheme
    use({
        "catppuccin/nvim",
        commit = "73587f9c454da81679202f1668c30fea6cdafd5e",
    })

    -- Status Line
    use({
        "nvim-lualine/lualine.nvim",
        commit = "2ac8d77575926d5c22f1d13f3e48000d579277e3",
    })

    -- Keymap Viewer
    use({
        "folke/which-key.nvim",
        commit = "94cb020ff33a1e0e22fac1c41663d2c439741f17",
    })

    -- Nerd Icons
    use({
        "kyazdani42/nvim-web-devicons",
        commit = "10940542e62087707b3dc0b4157d98c427504eb0",
    })

    -- Highlight symbol under cursor
    use({
        "RRethy/vim-illuminate",
        commit = "b671d8fff92dd21895f2f6c7ef1c7fa578cc0528",
    })

    -- Dashboard
    use({
        "goolord/alpha-nvim",
        commit = "87c204040e3f5d4c1c95067b35905d8f8a2f2545",
    })

    -- File Explorer
    use({
        "kyazdani42/nvim-tree.lua",
        commit = "9c60947926e5fb8a04f9fb8d798a1a7ff9126992",
    })

    -- Tree Parser & Syntax Highlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        commit = "cc360a9beb1b30d172438f640e2c3450358c4086",
    })

    -- Sticky Headers
    use({
        "nvim-treesitter/nvim-treesitter-context",
        commit = "bf8e96b1d8f2f6c5680b120a3ea455960c50f439",
    })

    -- Fuzzy Finder
    use({
        "nvim-telescope/telescope.nvim",
        commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
    })

    -- Git Gutter
    use({
        "lewis6991/gitsigns.nvim",
        commit = "f412f51d0eaf0905a2759c8087090071689bb8fb",
    })

    -- Git Client
    use({
        "tpope/vim-fugitive",
        commit = "e6651a79facf5cc2b7c554fdc19eb8a9fe89602c",
        cmd = { "Git" },
    })

    -- Comments
    use({
        "numToStr/Comment.nvim",
        commit = "2c26a00f32b190390b664e56e32fd5347613b9e2",
    })
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3",
    })

    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        commit = "857791d7331f2e036180147aea6235721b370f09",
    })
    use({
        "rafamadriz/friendly-snippets",
        commit = "631f79e346b0b3203d2ce3eae619ca8d612e5463",
    })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        commit = "11102d3db12c7f8b35265ad0e17a21511e5b1e68",
    })
    use({
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    })
    use({
        "hrsh7th/cmp-path",
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    })
    use({
        "saadparwaiz1/cmp_luasnip",
        commit = "18095520391186d634a0045dacaa346291096566",
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
    })
    use({
        "hrsh7th/cmp-nvim-lua",
        commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
    })

    -- Language Server Protocol
    use({
        "neovim/nvim-lspconfig",
        commit = "427378a03ffc1e1bc023275583a49b1993e524d0",
    })
    use({
        "williamboman/mason.nvim",
        commit = "253961cfe9b0a63b2524088be294acd7522366e5",
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        commit = "43f2ddf0b5f544d9bb20e24b8ff76b79f2a07ab0",
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        commit = "33b853a3933eed3137cd055aac4e539e69832ad0",
    })

    -- Debugger
    use({
        "mfussenegger/nvim-dap",
        commit = "debd7c2f80eaf20c5f5df25db8d8c1b9b18f4421",
    })
    use({
        "rcarriga/nvim-dap-ui",
        commit = "bdb94e3853d11b5ce98ec182e5a3719d5c0ef6fd",
    })
    use({
        "ravenxrz/DAPInstall.nvim",
        commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
    })

    -- Harpoon Man
    use("ThePrimeagen/harpoon")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
