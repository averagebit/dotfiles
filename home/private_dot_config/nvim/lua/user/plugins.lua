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
		commit = "6afb67460283f0e990d35d229fd38fdc04063e0a",
	})

	-- Plugin Caching
	use({
		"lewis6991/impatient.nvim",
		commit = "969f2c5c90457612c09cf2a13fee1adaa986d350",
	})

	-- Commond dependency
	use({
		"nvim-lua/plenary.nvim",
		commit = "968a4b9afec0c633bc369662e78f8c5db0eba249",
	})

	-- Colorscheme
	use({
		"catppuccin/nvim",
		commit = "ffd6f3e10445cb2c92401b75d4eccb75faf8b6b1",
	})

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		commit = "3362b28f917acc37538b1047f187ff1b5645ecdd",
	})

	-- Keymap Viewer
	use({
		"folke/which-key.nvim",
		commit = "6885b669523ff4238de99a7c653d47b081b5506d",
	})

	-- Nerd Icons
	use({
		"kyazdani42/nvim-web-devicons",
		commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e",
	})

	-- Highlight symbol under cursor
	use({
		"RRethy/vim-illuminate",
		commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5",
	})

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94",
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243",
	})

	-- Tree Parser & Syntax Highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "7ccb9a056fa43da243e3a439109c354c551c51b6",
	})

	-- Sticky Headers
	use({
		"nvim-treesitter/nvim-treesitter-context",
		commit = "8d0759eb798fee2e1201b26c3279713ac67c44c2",
	})

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0",
	})

	-- Git Gutter
	use({
		"lewis6991/gitsigns.nvim",
		commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f",
	})

	-- Git Client
	use({
		"tpope/vim-fugitive",
		commit = "96c1009fcf8ce60161cc938d149dd5a66d570756",
		cmd = { "Git" },
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		commit = "2c26a00f32b190390b664e56e32fd5347613b9e2",
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269",
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a",
	})
	use({
		"rafamadriz/friendly-snippets",
		commit = "d27a83a363e61009278b6598703a763ce9c8e617",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a",
	})
	use({
		"hrsh7th/cmp-buffer",
		commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323",
	})
	use({
		"hrsh7th/cmp-path",
		commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e",
	})
	use({
		"saadparwaiz1/cmp_luasnip",
		commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
		commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
		commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
	})

	-- Language Server Protocol
	use({
		"neovim/nvim-lspconfig",
		commit = "fc2f44dc6024bddb75b82e471c642ad1f4483094",
	})
	use({
		"williamboman/mason.nvim",
		commit = "a01073d9903ff25d9045b357d3d9fb63c4bc8e92",
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		commit = "38ab1f3b5e6182118f53f069c526f1251b2a951f",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		commit = "acdc4f1f576a0b1c36259b65dafb6c5fd0ab2e4b",
	})

	-- Debugger
	use({
		"mfussenegger/nvim-dap",
		commit = "61643680dcb771a29073cd432894e2f81a7c2ae3",
	})
	use({
		"rcarriga/nvim-dap-ui",
		commit = "1e21b3b50e67700e32285b5a74e645311fd8bbea",
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
