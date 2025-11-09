-- tab changes
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations
-- tab changes

vim.opt.clipboard = "unnamedplus" --uses the system clipboard

vim.opt.scrolloff = 100 -- keep the scroll in the middle.

vim.opt.ignorecase = true -- Set ignorecase option

vim.opt.foldmethod = "marker"
vim.opt.foldcolumn = "auto"
vim.opt.signcolumn = "auto"
vim.opt.pumblend = 30

vim.opt.cursorline = true -- set cursorline
vim.opt.cursorcolumn = true
vim.opt.textwidth = 120

vim.opt.colorcolumn = "+0,-20,-40"
vim.opt.laststatus = 3

vim.lsp.log.set_level("ERROR")
vim.opt.mouse = ""
vim.opt.fileformats = "unix,dos"
vim.opt.number = true
vim.opt.relativenumber = true

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

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>wxx", "<C-w>v<C-w>w")
vim.keymap.set({ "n", "v" }, "<leader>wz", "<C-w>|<C-w>_")
vim.keymap.set({ "n", "v" }, "<leader>wyy", "<C-w>s<C-w>w")
