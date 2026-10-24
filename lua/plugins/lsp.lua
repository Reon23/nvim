return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'saghen/blink.cmp' },
			{
				"rachartier/tiny-inline-diagnostic.nvim",
				event = "VeryLazy",
				priority = 1000,
				opts = {
					preset = "minimal",
					transparent_bg = true,
					options = {
						multilines = {
							enabled = true,
						},
					},
				},
			},
			{
				"rachartier/tiny-code-action.nvim",
				dependencies = {
					-- optional picker via telescope
					{ "nvim-telescope/telescope.nvim" },
					-- optional picker via fzf-lua
					{ "ibhagwan/fzf-lua" },
					-- .. or via snacks
					{
						"folke/snacks.nvim",
						opts = {
							terminal = {},
						}
					}
				},
				event = "LspAttach",
				opts = {},
			}
		},

		opts = {
			servers = {
				lua_ls = {},
				pyright = {},
				clangd = {
					filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
				},
			},
		},

		config = function(_, opts)
			vim.lsp.config('*', {
				capabilities = require('blink.cmp').get_lsp_capabilities(),
			})

			-- Diagnostics
			local severity = vim.diagnostic.severity

			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[severity.ERROR] = "󰚌 ",
						[severity.WARN] = "󰀦 ",
						[severity.HINT] = "󰫢 ",
						[severity.INFO] = "󰋖 ",
					},
				},
				underline = true,
				severity_sort = true,
				update_in_insert = false,

				float = {
					border = 'rounded',
					source = false,
					header = '',
					prefix = '',
					max_width = 80,
					focusable = true,
					wrap = true,
				},
			})

			-- Setup LSP servers
			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

			-- LSP functions
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

					-- Rename the variable under your cursor.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})

			vim.keymap.set({ "n", "x" }, "<leader>ca", function()
				require("tiny-code-action").code_action()
			end, { noremap = true, silent = true })
		end,
	},
	{
		"folke/lazydev.nvim",
		opts = {},
	},
}
