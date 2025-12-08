return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.get)
			vim.keymap.set("n", "grr", vim.lsp.buf.references)
			vim.keymap.set("n", "grn", vim.lsp.buf.rename)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"zls",
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
