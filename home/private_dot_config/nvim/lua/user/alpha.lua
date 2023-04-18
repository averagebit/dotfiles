local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files<CR>"),
	dashboard.button("e", " " .. " New file", "<cmd>ene <BAR> startinsert<CR>"),
	dashboard.button("r", " " .. " Recent files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("h", "ﴤ " .. " Home", "<cmd>cd ~/.dot | :e home/dot_bashrc<CR>"),
	dashboard.button("n", "歷" .. " Network", "<cmd>cd ~/Workspace/home/home-network | :e README.md<CR>"),
	dashboard.button("l", "" .. "  Laboratory", "<cmd>cd ~/Workspace/home/home-ops | :e README.md<CR>"),
	dashboard.button("c", " " .. " Configuration", "<cmd>cd ~/.dot/home/private_dot_config/nvim | :e init.lua<CR>"),
	dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
}

local function footer()
	return "github.com/neovim"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
