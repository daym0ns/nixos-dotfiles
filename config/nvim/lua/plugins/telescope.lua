return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = "move_selection_previous",
							["<C-j>"] = "move_selection_next",
						},
					},
				},
			})
			vim.g.mapleader = " "
			vim.keymap.set("n", "<leader>ff", ":Telescope find_files <CR>")
			vim.keymap.set("n", "<leader>fg", ":Telescope live_grep <CR>")
			vim.keymap.set("n", "<leader>fh", ":Telescope help_tags <CR>")
			vim.keymap.set("n", "<leader>fb", ":Telescope buffers <CR>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
