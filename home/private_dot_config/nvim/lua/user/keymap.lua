local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank to the end of the line
map("n", "Y", "y$", opts)

-- Re-select blocks after indenting in visual/select mode
map("x", "<", "<gv", opts)
map("x", ">", ">gv|", opts)

-- Indent and jump to first non-blank character linewise
map("n", ">>", ">>_", opts)
map("n", "<<", "<<_", opts)

-- Maintain cursor position and keep it centered during search & joining
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Drag current line/s vertically and auto-indent
map("n", "<Leader>k", "<cmd>m-2<CR>", opts)
map("n", "<Leader>j", "<cmd>m+<CR>", opts)
map("v", "<Leader>k", "<cmd>m'<-2<CR>gv=gv", opts)
map("v", "<Leader>j", "<cmd>m'>+<CR>gv=gv", opts)

-- Resize with arrows
map("n", "<Up>", "<cmd>resize -2<CR>", opts)
map("n", "<Down>", "<cmd>resize +2<CR>", opts)
map("n", "<Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<Right>", "<cmd>vertical resize +2<CR>", opts)

-- Toggle editor's visual effects
map("n", "<CR>", "<cmd>let @/ = ''<CR><CR>", opts)

-- Edit dotfiles
map("n", "<Leader>rca", "<cmd>cd ~/.config/alacritty<CR> | <cmd>e alacritty.yml<CR>", opts)
map("n", "<Leader>rcs", "<cmd>cd ~/.ssh<CR> | <cmd>e config<CR>", opts)
map("n", "<Leader>rct", "<cmd>cd ~/.config/tmux<CR> | <cmd>e tmux.conf<CR>", opts)
map("n", "<Leader>rcv", "<cmd>cd ~/.config/nvim<CR> | <cmd>e init.lua<CR>", opts)

vim.cmd([[
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev qw wq
    cnoreabbrev Wq wq
    cnoreabbrev WQ wq
    cnoreabbrev Qa qa
    cnoreabbrev Bd bd
    cnoreabbrev bD bd
]])

-- Telescope
map("n", "<leader>p", "<cmd>Telescope find_files<CR>", opts)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
