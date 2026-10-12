return {
  "kdheepak/monochrome.nvim",
  config = function()
    vim.cmd "colorscheme monochrome"

    vim.cmd [[
	      highlight Normal guibg=none ctermbg=none
	      highlight NormalNC guibg=none
	      highlight NonText guibg=none
	      highlight LineNr guibg=none
	    ]]
  end,
}
