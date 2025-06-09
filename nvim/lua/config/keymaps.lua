-- Disable arrow keys in insert mode only. I have a custom keyboard, that has
-- the arrow keys on h, j, k, and l with a modifier
local opts = { noremap = true, silent = true }
vim.keymap.set("i", "<Down>", "<Nop>", opts)
vim.keymap.set("i", "<Left>", "<Nop>", opts)
vim.keymap.set("i", "<Right>", "<Nop>", opts)
vim.keymap.set("i", "<Up>", "<Nop>", opts)
