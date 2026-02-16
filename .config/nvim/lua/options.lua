require "nvchad.options"
-- add yours here!

local o = vim.o
local opt = vim.opt
-- local g = vim.g.diso

opt.laststatus = 4 -- global statusline
opt.showmode = false
opt.linebreak = true
opt.swapfile = false
opt.winborder = "rounded"
-- opt.scrolloff = 999
-- opt.inccommand = 'split'
opt.list = true
opt.listchars = {
    tab = '>  ',
    trail = '<',
    extends = '>',
    precedes = '<',
    space = '·',
}
opt.iskeyword:remove('_')
opt.iskeyword:remove('-')
opt.sessionoptions:remove("folds")
vim.opt_local.foldmethod = 'indent'

-- Indenting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
-- opt.wrap = false

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = true
opt.relativenumber = true

o.cursorlineopt = 'both' -- to enable cursorline!
-- opt.cursorcolumn = true

vim.lsp.set_log_level("trace")
vim.diagnostic.enable(false)

-- Disabling built-in syntax highlighting
vim.cmd.syntax("manual")
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitsendemail", "conf", "editorconfig", "qf", "checkhealth", "less", "Oil" },
    callback = function(event)
        vim.bo[event.buf].syntax = vim.bo[event.buf].filetype
    end,
})

require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    columns = {
        -- "icon",
        "permissions",
        "size",
        "mtime",
    },
    view_options = {
        show_hidden = true,
    },
    preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
        win_options = {},
    },
    use_default_keymaps = false,
    keymaps = {
        ["<C-f>"] = { "actions.select", mode = "n" },
        ["<C-b>"] = { "actions.parent", mode = "n" },
        ["<C-r>"] = "actions.refresh",
        ["<C-c>"] = "actions.close",
    },
    lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = true,
    },
})

require("which-key").setup()
-- require("hardtime").setup({     --HardMode
--     disabled_filetypes = {
--         ["compilation"] = true, -- Disable Hardtime in filetype starting with Compile Mode
--         ["vim"] = true,         -- Disable Hardtime in filetype starting with Compile Mode
--     },
-- })

