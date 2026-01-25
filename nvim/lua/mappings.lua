-- Set leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Helper alias for cleaner mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, opts)
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, opts)
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end, opts)
map("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, opts)

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", opts)
map("n", "<leader>xl", "<cmd>trouble loclist toggle<cr>", opts)
map("n", "<leader>cl", "<cmd>trouble lsp toggle<cr>", opts)

-- Movement
map("n", "å", "{", opts)
map("n", "ö", "}", opts)
map({ "n", "v" }, "+", "$", opts) -- ✅ works in both normal + visual mode

-- Selection
map("n", "<leader>a", "ggVG", opts) -- Select all
map("n", "<leader>r", ":%s///g<LEFT><LEFT>", opts) -- quick SED

-- Clear search highlight
map("n", "<leader>cl", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight", noremap = true, silent = true })
