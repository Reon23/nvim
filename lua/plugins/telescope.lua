return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		{
			"nvim-telescope/telescope-frecency.nvim",
			-- install the latest stable version
			version = "*",
			config = function()
				require("telescope").load_extension "frecency"
			end,
		},
	},

	config = function()
		require("nvim-web-devicons").setup({
			color_icons = false,
		})
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope buffers' })
	end,
}
