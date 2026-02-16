-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for

local M = {}

-- UI
M.base_30 = {
    white = "#e4e4ef",         -- Main foreground/text color
    black = "#181818",         -- Main background (gruber-darker-bg)
    darker_black = "#101010",  -- 6% darker than black (gruber-darker-bg-1)
    black2 = "#282828",        -- 6% lighter than black (gruber-darker-bg+1)
    one_bg = "#282828",        -- 10% lighter than black (same as black2)
    one_bg2 = "#453d41",       -- 6% lighter than one_bg (gruber-darker-bg+2)
    one_bg3 = "#484848",       -- 6% lighter than one_bg2 (gruber-darker-bg+3)
    grey = "#484848",          -- 40% lighter than black (gruber-darker-bg+3)
    grey_fg = "#52494e",       -- 10% lighter than grey (gruber-darker-bg+4)
    grey_fg2 = "#565f73",      -- 5% lighter than grey (gruber-darker-niagara-1)
    light_grey = "#95a99f",    -- Light grey (gruber-darker-quartz)

    red = "#c73c3f",           -- Error red (gruber-darker-red-1)
    baby_pink = "#f43841",     -- Light red/pink (gruber-darker-red)
    pink = "#ff4f58",          -- Brighter red (gruber-darker-red+1)

    line = "#303030",          -- 15% lighter than black (custom color)
    green = "#73c936",         -- Success green (gruber-darker-green)
    vibrant_green = "#73c936", -- Same as green

    nord_blue = "#565f73",     -- Muted blue (gruber-darker-niagara-1)
    blue = "#96a6c8",          -- Primary blue (gruber-darker-niagara)
    seablue = "#96a6c8",       -- Same as blue

    yellow = "#ffdd33",        -- Yellow (gruber-darker-yellow)
    sun = "#ffdd33",           -- Same as yellow

    purple = "#9e95c7",        -- Purple (gruber-darker-wisteria)
    dark_purple = "#9e95c7",   -- Same as purple

    teal = "#95a99f",          -- Teal (gruber-darker-quartz)
    orange = "#cc8c3c",        -- Orange/Brown (gruber-darker-brown)
    cyan = "#95a99f",          -- Cyan (gruber-darker-quartz)

    statusline_bg = "#282828", -- Statusline background (gruber-darker-bg+1)
    lightbg = "#282828",       -- Lighter background (gruber-darker-bg+1)
    pmenu_bg = "#96a6c8",      -- Popup menu selected item (gruber-darker-niagara)
    folder_bg = "#96a6c8",     -- Folder icon color (gruber-darker-niagara)
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
M.base_16 = {
    base00 = "#181818", -- Default Background (gruber-darker-bg)
    base01 = "#282828", -- Lighter Background (gruber-darker-bg+1)
    base02 = "#303030", -- Selection Background (custom, based on line color)
    base03 = "#484848", -- Comments, Invisibles (gruber-darker-bg+3)
    base04 = "#95a99f", -- Dark Foreground (gruber-darker-quartz)
    base05 = "#c0c0c5", -- Default Foreground (custom, lighter than e4e4ef)
    base06 = "#d0d0d5", -- Light Foreground (custom)
    base07 = "#e4e4ef", -- Light Background (gruber-darker-fg)
    base08 = "#c73c3f", -- Variables, XML Tags, etc. (gruber-darker-red-1)
    base09 = "#cc8c3c", -- Integers, Boolean, Constants (gruber-darker-brown)
    base0A = "#ffdd33", -- Classes, Markup Bold (gruber-darker-yellow)
    base0B = "#73c936", -- Strings, Inherited Class (gruber-darker-green)
    base0C = "#95a99f", -- Support, Regular Expressions (gruber-darker-quartz)
    base0D = "#96a6c8", -- Functions, Methods, Attribute IDs (gruber-darker-niagara)
    base0E = "#9e95c7", -- Keywords, Storage, Selector (gruber-darker-wisteria)
    base0F = "#f43841", -- Deprecated, Embedded Language Tags (gruber-darker-red)
}

-- -- OPTIONAL
-- -- overriding or adding highlights for this specific theme only
-- -- defaults/treesitter is the filename i.e integration there,

M.polish_hl = {
    defaults = {
        Comment = {
            fg = M.base_30.orange, -- Comments use brown color (gruber-darker-brown)
            italic = true,         -- Gruber style uses italic comments
        },
        Normal = {
            fg = M.base_30.white,
            bg = M.base_30.black,
        },
        NormalFloat = {
            bg = M.base_30.black,
        },
        Search = {
            bg = M.base_30.yellow,
            fg = M.base_16.base00,
        },
        IncSearch = {
            bg = M.base_30.orange,
            fg = M.base_16.base00,
        },
        Visual = {
            bg = M.base_30.nord_blue,
        },
        CursorLine = {
            bg = M.base_30.black2,
        },
        ColorColumn = {
            bg = M.base_30.one_bg,
        },
        Cursor = {
            bg = M.base_30.yellow,
        },
        MatchParen = {
            bg = M.base_30.grey_fg,
        },
        Pmenu = {
            bg = M.base_30.black2,
            fg = M.base_30.white,
        },
        PmenuSel = {
            bg = M.base_30.pmenu_bg,
            fg = M.base_30.black,
        },
        LineNr = {
            fg = M.base_30.grey_fg,
        },
        CursorLineNr = {
            fg = M.base_30.yellow,
        },
        VertSplit = {
            fg = M.base_30.grey_fg,
        },
        StatusLine = {
            bg = M.base_30.statusline_bg,
            fg = M.base_30.white,
        },
        StatusLineNC = {
            bg = M.base_30.statusline_bg,
            fg = M.base_30.teal,
        },
    },

    treesitter = {
        ["@variable"] = { fg = M.base_30.white },
        ["@variable.builtin"] = { fg = M.base_30.cyan },
        ["@property"] = { fg = M.base_30.white },
        ["@field"] = { fg = M.base_30.white },
        ["@parameter"] = { fg = M.base_30.white },
        ["@function"] = { fg = M.base_30.blue },
        ["@function.builtin"] = { fg = M.base_30.blue },
        ["@function.call"] = { fg = M.base_30.blue },
        ["@method"] = { fg = M.base_30.blue },
        ["@method.call"] = { fg = M.base_30.blue },
        ["@constructor"] = { fg = M.base_30.blue },
        ["@keyword"] = { fg = M.base_30.yellow, bold = true },
        ["@keyword.function"] = { fg = M.base_30.yellow, bold = true },
        ["@keyword.operator"] = { fg = M.base_30.yellow },
        ["@keyword.return"] = { fg = M.base_30.yellow, bold = true },
        ["@conditional"] = { fg = M.base_30.yellow, bold = true },
        ["@repeat"] = { fg = M.base_30.yellow, bold = true },
        ["@type"] = { fg = M.base_30.teal },
        ["@type.builtin"] = { fg = M.base_30.teal },
        ["@type.definition"] = { fg = M.base_30.teal },
        ["@storageclass"] = { fg = M.base_30.yellow },
        ["@attribute"] = { fg = M.base_30.cyan },
        ["@constant"] = { fg = M.base_30.teal },
        ["@constant.builtin"] = { fg = M.base_30.teal },
        ["@constant.macro"] = { fg = M.base_30.teal },
        ["@number"] = { fg = M.base_30.purple },
        ["@float"] = { fg = M.base_30.purple },
        ["@boolean"] = { fg = M.base_30.orange },
        ["@string"] = { fg = M.base_30.green },
        ["@string.escape"] = { fg = M.base_30.cyan },
        ["@string.regex"] = { fg = M.base_30.cyan },
        ["@string.special"] = { fg = M.base_30.cyan },
        ["@character"] = { fg = M.base_30.green },
        ["@character.special"] = { fg = M.base_30.cyan },
        ["@operator"] = { fg = M.base_30.cyan },
        ["@punctuation.delimiter"] = { fg = M.base_30.cyan },
        ["@punctuation.bracket"] = { fg = M.base_30.white },
        ["@punctuation.special"] = { fg = M.base_30.cyan },
        ["@comment"] = { fg = M.base_30.orange, italic = true },
        ["@comment.documentation"] = { fg = M.base_30.orange, italic = true },
        ["@tag"] = { fg = M.base_30.yellow },
        ["@tag.attribute"] = { fg = M.base_30.blue },
        ["@tag.delimiter"] = { fg = M.base_30.cyan },
        ["@text.title"] = { fg = M.base_30.blue, bold = true },
        ["@text.literal"] = { fg = M.base_30.green },
        ["@text.reference"] = { fg = M.base_30.blue },
        ["@text.strong"] = { fg = M.base_30.teal, bold = true },
        ["@text.emphasis"] = { fg = M.base_30.teal, italic = true },
        ["@text.uri"] = { fg = M.base_30.blue, underline = true },
        ["@text.note"] = { fg = M.base_30.purple },
        ["@text.warning"] = { fg = M.base_30.orange },
        ["@text.danger"] = { fg = M.base_30.red },
        ["@text.diff.add"] = { fg = M.base_30.green },
        ["@text.diff.delete"] = { fg = M.base_30.red },
    },
}

-- set the theme type whether is dark or light
M.type = "dark" -- Gruber Darker is a dark theme

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "gruber-darker")

return M
