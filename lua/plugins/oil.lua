return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
	},
	lazy = false,

	opts = {
		keymaps = {
			["<C-s>"] = false,
			["<C-h>"] = false,
			["<C-j>"] = false,
			["<C-k>"] = false,
			["<C-l>"] = false,
			["<C-q>"] = { "actions.close", mode = "n" },
		},

		view_options = {
			show_hidden = true
		},

		win_options = {
			signcolumn = "auto:2",
		},
	},

	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true, desc = "Open File Explorer" })
	end,
}
