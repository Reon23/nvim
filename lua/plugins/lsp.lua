return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  opts = {
    servers = {
      lua_ls = {},
	  pyright = {},
    },
  },
   config = function(_, opts)
     vim.lsp.config('*', {
       capabilities = require('blink.cmp').get_lsp_capabilities(),
     })
     for server, config in pairs(opts.servers) do
       vim.lsp.config(server, config)
       vim.lsp.enable(server)
     end
   end,
}
