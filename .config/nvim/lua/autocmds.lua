require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- highlight yank
autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    desc = "highlight selection on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end,
})

-- no auto continue comments on new line
autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_auto_comment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- open help in vertical split
autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

-- auto resize splits when the terminal's window is resized
autocmd("VimResized", {
    command = "wincmd =",
})

-- auto-change working directory when navigating in oil
autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "oil" then
            if require("oil").get_current_dir() then
                vim.cmd.cd(require("oil").get_current_dir())
                -- require("nvim-tree.api").tree.change_root(require("oil").get_current_dir())
            end
        end
    end,
})

-- -- show nvdash when all buffers are closed
-- autocmd("BufDelete", {
--     callback = function()
--         local bufs = vim.t.bufs
--         if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
--             vim.cmd "Nvdash"
--         end
--     end,
-- })

-- use q for quick exit in some buffer windows
autocmd('FileType', {
    pattern = {
        'checkhealth',
        'help',
        'lspinfo',
        'notify',
        'nofile',
        'oil',
        'qf',
        'nvdash',
        -- 'compilation',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', function()
            require("nvchad.tabufline").close_buffer()
        end, { buffer = event.buf, silent = true })
        -- vim.keymap.set('n', 'q', "<CMD>q<CR>", { buffer = event.buf, silent = true })
    end,
    desc = 'Enable q to quit in help-like buffers',
})

-- Restore cursor position
autocmd('BufReadPost', {
    callback = function()
        local exclude = { 'gitcommit' }
        local buf = vim.api.nvim_get_current_buf()
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local line_count = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    desc = 'Restore cursor position on file reopen',
})

-- RestoreFolds
autocmd("BufWinLeave", {
    pattern = "?*",
    command = "mkview"
})
autocmd("BufWinEnter", {
    pattern = "?*",
    command = "silent! loadview"
})
