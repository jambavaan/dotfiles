local function get_clang_format_path()
    local pwd = vim.fn.getcwd()
    local format_path
    local pwd_clang_format_hnd = io.open(".clang_format", "r")
    if pwd_clang_format_hnd == nil then
        format_path = os.getenv("HOME") .. "/.config/nvim/.clang-format"
    else
        io.close(pwd_clang_format_hnd)
        format_path = pwd .. "/.clang_format"
    end
    return format_path
end

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },
    formatters = {
        ["clang-format"] = {
            -- You can add arguments here if you don't use a .clang-format file
            prepend_args = { "--style=file:" .. get_clang_format_path() },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = false,
    },
}

return options
