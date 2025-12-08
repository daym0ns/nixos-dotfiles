return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v1.8.0",
		config = function()
			vim.keymap.set("i", "<C-x>", "<Nop>", { noremap = true })
			require("blink.cmp").setup({
				fuzzy = { prebuilt_binaries = { force_version = "v1.8.0" } },
				keymap = {
					preset = "default",
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<C-c>"] = { "hide", "fallback" },
					["<C-x>"] = { "show", "fallback" },
					["<Tab>"] = { "accept", "fallback" },
				},
				appearance = { nerd_font_variant = "mono" },
			})
		end,
	},
}
