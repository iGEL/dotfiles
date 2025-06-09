-- Set <Space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic options
vim.opt.compatible = false
vim.opt.history = 1000
vim.opt.encoding = 'utf-8'

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.updatetime = 100
vim.opt.hidden = false
vim.opt.wrap = true
vim.opt.number = true

-- Create backup directory if it doesn't exist
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/backups"), "p")
vim.opt.undodir = vim.fn.expand("~/.config/nvim/backups")
vim.opt.undofile = true

-- Indentation and tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- Search
vim.opt.hlsearch = true -- highlight matches
vim.opt.incsearch = true -- ... incrementally while typing
vim.opt.ignorecase = true -- searches are case insensitive...
vim.opt.smartcase = true -- ... unless they contain at least one capital letter

-- No swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Displaying
vim.opt.guicursor = 'a:blinkon0' -- No cursor blinking
vim.opt.visualbell = true -- No sounds

-- Display tabs and trailing spaces visually
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }

-- Highlight current line & row
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end,
})
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  pattern = "*",
  callback = function()
    if vim.opt.cursorline:get() then
      vim.opt.cursorline = false
      vim.opt.cursorcolumn = false
    end
  end,
})

-- Open splits on the right and below instead of the left & above
vim.opt.splitbelow = true
vim.opt.splitright = true

require("config.lazy")
require("config.keymaps")
require("config.lsp")

-- Colors & scheme
vim.opt.termguicolors = true
vim.opt.background = "light"
