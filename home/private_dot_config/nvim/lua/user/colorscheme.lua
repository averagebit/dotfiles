local colorscheme = "catppuccin"

require("catppuccin").setup({
	transparent_background = true,
	term_colors = false,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	color_overrides = {
		all = {
			text = "#ffffff",
		},
		latte = {
			base = "#ff0000",
			mantle = "#242424",
			crust = "#474747",
		},
		frappe = {},
		macchiato = {},
		mocha = {},
	},
	highlight_overrides = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		treesitter = true,
		-- nvimtree = true,
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
			enabled = false,
			enable_ui = false,
		},
	},
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	return
end
