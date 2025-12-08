require("oil").setup()
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

require("mini.pick").setup({ mappings = { move_up = "<C-k>", move_down = "<C-j>" } })
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")

vim.cmd([[colorscheme vague]])
require('nvim-highlight-colors').setup({})
require('lualine').setup({
  sections = { lualine_x = { 'filetype' }, lualine_b = {} },
  options = { section_separators = { left = '', right = '' }, component_separators = { left = '', right = '' }, theme = 'auto' }
})

vim.lsp.enable({
	"lua_ls",
})

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    'lua',
    'nix',
    'go',
  }
}

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})

require('blink.cmp').setup({
  fuzzy = { prebuilt_binaries = { force_version = 'v1.8.0' } },
  keymap = { preset = 'default',
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-c>'] = { 'hide', 'fallback' },
    ['<C-x>'] = { 'show', 'fallback' },
    ['<Tab>'] = { 'accept', 'fallback'}
  },
  appearance = { nerd_font_variant='mono' },
})
