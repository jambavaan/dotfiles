-- These are some examples, uncomment them if you want to see them work!
return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        -- opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "lervag/vimtex",
        ft = { "tex" },
        init = function()
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_mappings_enabled = 1
            vim.g.vimtex_syntax_enabled = 1
            vim.g.vimtex_indent_enabled = 0

            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = "/tmp/" -- you can set here whatever name you desire
            }
            -- vim.g.snipmate_snippets_path = '~/.config/snippets/'
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    {
        "ej-shafran/compile-mode.nvim",
        version = "^5.0.0",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- if you want to enable coloring of ANSI escape codes in compilation output, add:
            -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = function()
            vim.g.compile_mode = {
                default_command = "",
                focus_compilation_buffer = true,
                -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
                -- set this to fix tab completion in command mode:
                input_word_completion = true,
                -- to add ANSI escape code support, add:
                -- baleia_setup = true,
                ask_about_save = false,
                -- to make `:Compile` replace special characters (e.g. `%`) in
                -- the command (and behave more like `:!`), add:
                -- bang_expansion = true,
                hidden_buffer = false,
            }
        end
    },

    {
        'stevearc/oil.nvim',
        -- dependencies = {
        --     {
        --         "nvim-mini/mini.icons",
        --         opts = {}
        --     }
        -- },
    },

    -- {
    --     "m4xshen/hardtime.nvim",
    --     lazy = false,
    --      dependencies = { "MunifTanjim/nui.nvim" },
    --     opts = {},
    -- },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ft = { "markdown" },
        opts = {
            completions = {
                blink = {
                    enabled = true
                }
            },
        },
    },

    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*", -- Use the latest tagged version
        lazy = false,
        opts = {},   -- This causes the plugin setup function to be called
        keys = {
            { "<A-j>",         "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "x" },    desc = "Add cursor and move down" },
            { "<A-k>",         "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "x" },    desc = "Add cursor and move up" },
            { "<S-m>",         "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" },    desc = "Add cursor and jump to next cword" },
            { "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
            { "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "i", "x" }, desc = "Add cursor and move down" },
            { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",   mode = { "n", "i" },    desc = "Add or remove cursor" },
            { "<Leader>m",     "<Cmd>MultipleCursorsAddVisualArea<CR>",    mode = { "x" },         desc = "Add cursors to the lines of the visual area" },
            { "<Leader>a",     "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" },    desc = "Add cursors to cword" },
            { "<Leader>A",     "<Cmd>MultipleCursorsAddMatchesV<CR>",      mode = { "n", "x" },    desc = "Add cursors to cword in previous area" },
            { "<Leader>D",     "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" },    desc = "Jump to next cword" },
            { "<Leader>l",     "<Cmd>MultipleCursorsLock<CR>",             mode = { "n", "x" },    desc = "Lock virtual cursors" },
        },
    },

    -- {
    --     "nvzone/showkeys",
    --     cmd = "ShowkeysToggle",
    --     opts = {
    --         timeout = 1,
    --         maxkeys = 5,
    --         position = "bottom-center",
    --         show_count = true,
    --         -- more opts
    --     }
    -- },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },

    -- disable
    {
        "windwp/nvim-autopairs",
        enabled = false
    },
    {
        "nvim-tree/nvim-tree.lua",
        enabled = false
    },
}
