return {
	"jay-babu/mason-nvim-dap.nvim",

	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	opts = {
		automatic_installation = true,
		ensure_installed = {
			"python",
		},
	},

	config = function(_, opts)
		require("mason-nvim-dap").setup(opts)

		local dap = require("dap")
		local python = require("plugins.dap.config.python")

		dap.adapters.python = python[1]

		dap.configurations.python = python[2]


		local dapui = require("dapui")

		dapui.setup()

		vim.keymap.set("n", "<Leader>dc", dap.continue,
			{ silent = true, desc = "Debug continue" })
		vim.keymap.set("n", "<Leader>dr", dap.repl.open,
			{ silent = true, desc = "Debug open REPL" })
		vim.keymap.set("n", "<Leader>dx", dap.terminate,
			{ silent = true, desc = "Debug terminate" })

		vim.keymap.set("n", "<Leader>do", dap.step_over,
			{ silent = true, desc = "Debug step over" })
		vim.keymap.set("n", "<Leader>di", dap.step_into,
			{ silent = true, desc = "Debug step into" })
		vim.keymap.set("n", "<Leader>dt", dap.step_out,
			{ silent = true, desc = "Debug step out" })
		vim.keymap.set("n", "<Leader>dl", dap.run_last,
			{ silent = true, desc = "Debug run last" })

		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint,
			{ silent = true, desc = "Debug toggle breakpoint" })

		vim.keymap.set("n", "<Leader>duu", dapui.open,
			{ silent = true, desc = "Debug open UI" })
		vim.keymap.set("n", "<Leader>duc", dapui.close,
			{ silent = true, desc = "Debug close UI" })

		-- Open ui during debug
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
