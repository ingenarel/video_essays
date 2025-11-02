require("configs")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>wxx", "<C-w>v<C-w>w") vim.keymap.set({ "n", "v" }, "<leader>wz", "<C-w>|<C-w>_")
vim.keymap.set({ "n", "v" }, "<leader>wyy", "<C-w>s<C-w>w")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local out = vim.system({
		"git",
		"clone",
		"--depth=10",
		"--branch=main",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	}):wait()

	if out.code ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out.stderr, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
	version = nil,
	spec = {
		{
			{
				"ingenarel/cyberpunk-neon.nvim",
				config = function()
					vim.cmd.colorscheme("cyberpunk-neon")
				end,
			},
		},
	},
})
