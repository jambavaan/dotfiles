require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

del("n", "<C-n>", { desc = "testUnbind Ctrl n" })

-- map({"n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "i" }, "jk", "<ESC>")
map({ "i" }, "kj", "<ESC>")

-- map("i", "<C-e>", "<End>", { desc = "move end of line" })
-- map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
-- map("i", "<C-b>", "<Left>", { desc = "move left" })
-- map("i", "<C-f>", "<Right>", { desc = "move right" })
-- map("i", "<C-n>", "<Down>", { desc = "move down" })
-- map("i", "<C-p>", "<Up>", { desc = "move up" })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- map("n", "<C-l>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<CR>", "za", { desc = "Toggle fold" })

map("n", "<S-j>", ":m .+1<CR>>==", { desc = "Move line down", noremap = true, silent = true })
map("n", "<S-k>", ":m .-2<CR>>==", { desc = "Move line up", noremap = true, silent = true })
map("v", "<S-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection up", noremap = true, silent = true })
map("v", "<S-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true, silent = true })

map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

map("n", "n", "nzzzv", { desc = "Center shit", noremap = true, silent = true })
map("n", "N", "Nzzzv", { desc = "Center shit", noremap = true, silent = true })
map("n", ",", "0jzz", { desc = "Center shit", noremap = true, silent = true })
map("n", ".", "0kzz", { desc = "Center shit", noremap = true, silent = true })

map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>//gIc<Left><Left><Left><Left>]],
    { desc = "Search/replace the word under cursor across the whole file", silent = false })
map("v", "<leader>sr", [[:s///gIc<Left><Left><Left><Left><Left>]],
    { desc = "Search/replace the word across the selected block", silent = false })

map('n', '<leader>tt', require('base46').toggle_transparency, { desc = 'Toggle transparency' })
map('n', '<leader>td', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "LSP Diagnostic", silent = true, noremap = true })

-- Window management

map("n", "<leader>v", "<C-w>v", { desc = "split window vertically", noremap = true, silent = true })
map("n", "<leader>h", "<C-w>s", { desc = "split window horizontally", noremap = true, silent = true })
map("n", "<leader>W", ":close<CR>", { desc = "close current split window", noremap = true, silent = true })
-- map("n", "<leader>se", "<C-w>=", { desc = "make split windows equal width & height", noremap = true, silent = true })

-- Navigate between splits
-- map("n", "<C-h>", "<C-w>h", { desc = "switch window left"  })
-- map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "switch window down"  })
-- map("n", "<C-k>", "<C-w>k", { desc = "switch window up"    })

-- map({ "n", "v" }, "<Space>", "<Nop>", { silent = true, noremap = true })
map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i" }, "<C-\\>", "mmyyp`mj", { desc = "Duplicate-line", noremap = true, silent = true })
map({ "n", "v" }, "fj", "<CMD>Compile<CR>", { desc = "Run a command" })
