local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>")
keymap.set("n", "<C-Down>", ":resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Better paste
keymap.set("v", "p", '"_dP')

-- Stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Save file
keymap.set("n", "<C-s>", ":w<CR>")

-- Quit
keymap.set("n", "<leader>q", ":q<CR>")

-- Noice
keymap.set("n", "<leader>sn", "<cmd>Noice<cr>", { desc = "Noice" })
keymap.set("n", "<leader>snh", "<cmd>Noice history<cr>", { desc = "Noice History" })
keymap.set("n", "<leader>sna", "<cmd>Noice all<cr>", { desc = "Noice All" })

-- Terminal
keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal" })
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })

-- Lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Dashboard
keymap.set("n", "<leader>d", "<cmd>Dashboard<cr>", { desc = "Dashboard" })

-- Buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Clear search highlight
keymap.set("n", "<ESC>", ":noh<CR>", { desc = "Clear search highlight" })

-- Better escape
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Center screen after moving
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Quickfix navigation
keymap.set("n", "<leader>xn", ":cnext<CR>", { desc = "Next quickfix" })
keymap.set("n", "<leader>xp", ":cprev<CR>", { desc = "Previous quickfix" })
