return {
	-- adapter
	{
		type = "executable",
		command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
		args = { "-m", "debugpy.adapter" },
	},

	-- config
	{
		{
			type = "python",
			request = "launch",
			name = "Launch current file",
			program = "${file}",
			pythonPath = function()
				local cwd = vim.fn.getcwd()

				if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				else
					return vim.fn.exepath("python3")
				end
			end,
		}
	},
}
