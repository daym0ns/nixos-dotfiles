local pax = require("pax")
local plugins = {
	"stevearc/oil.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-lua/plenary.nvim",
	"vague-theme/vague.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-mini/mini.pick",
	"neovim/nvim-lspconfig",
  "Saghen/blink.cmp",
	"brenoprata10/nvim-highlight-colors",
	"nvim-treesitter/nvim-treesitter",
	"nvimtools/none-ls.nvim",
}

vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.o.ignorecase = true
vim.opt.undofile = true
vim.opt.number = true

vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.wrap = false

vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.cursorlineopt = "number"
vim.opt.backspace = "indent,eol,start"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.cmd([[filetype plugin on]])

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", ":update<CR>:source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p')

local augroup = vim.api.nvim_create_augroup("UserConfig", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

pax.ensureTable(plugins)
require("pconfigs")
