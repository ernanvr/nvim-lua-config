local keymap = vim.keymap
keymap.set("i", "jj", "<Esc>", { noremap = true })
keymap.set("n", "<S-l>", "<cmd>BufferNext<CR>", { noremap = true })
keymap.set("n", "<S-h>", "<cmd>BufferPrevious<CR>", { noremap = true })
keymap.set("i", "<C-l>", "<C-o>a", { noremap = true })
keymap.set("n", "<C-;>", "<C-o>$", { noremap = true })
keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
keymap.set("n", "<C-c>", "<cmd>BufferClose<CR>", { noremap = true })
