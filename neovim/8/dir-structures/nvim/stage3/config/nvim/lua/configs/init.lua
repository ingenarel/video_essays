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

require("configs.keybinds")
