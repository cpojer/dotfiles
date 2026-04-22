vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.mouse = "a"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.foldenable = false
opt.foldlevel = 99
opt.clipboard = "unnamedplus"
opt.updatetime = 200
opt.timeoutlen = 300
opt.showmode = false
opt.confirm = true
opt.shortmess:append("I")
opt.completeopt = { "menu", "menuone", "noselect" }

if vim.fn.has("nvim-0.11") == 1 then
  opt.winborder = "rounded"
end
