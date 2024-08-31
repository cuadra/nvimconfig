local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Navigating buffers
keymap("n", "<leader>h", ":bprevious<cr>", opts)
keymap("n", "<leader>l", ":bnext<cr>", opts)

-- Find and get ready to replace
keymap("n", "<leader>f", ":%s/", opts)

-- New Buffer
keymap("n", "<leader>n", ":enew<cr>", opts)

-- Writing and Exiting
keymap("n", "<leader>s", ":w<cr>", opts)
keymap("n", "<leader>w", ":bd<cr>", opts)

-- Stay in indent mode
keymap("v", "h", "<gv^", opts)
keymap("v", "l", ">gv^", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Visual Block --

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<S-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<S-k>", ":m '<-2<CR>gv=gv", opts)


