return {
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			require("vague").setup()
			vim.cmd("colorscheme vague")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				sections = { lualine_x = { "filetype" }, lualine_b = {} },
				options = {
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
			})
		end,
	},
}
