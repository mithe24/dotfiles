return {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    opts = {},

    config = function ()
        require("neopywal").setup({
            -- Sets the background color of certain highlight groups to be transparent.
            -- Use this when your terminal opacity is < 1.
            transparent_background = true,

            -- Dims the background when another window is focused.
            dim_inactive = true,

            -- Apply colorscheme for Neovim's terminal (e.g. `g:terminal_color_0`).
            terminal_colors = true,

            -- Shows the '~' characters after the end of buffers.
            show_end_of_buffer = true,

            -- Shows the '|' split separator characters.
            -- It's worth noting that this options works better in conjunction with `dim_inactive`.
            show_split_lines = true,

            no_italic = true, -- Force no italic.
            no_bold = false, -- Force no bold.
            no_underline = false, -- Force no underline.
            no_undercurl = false, -- Force no undercurl.
            no_strikethrough = false, -- Force no strikethrough.

            -- Handles the styling of certain highlight groups (see `:h highlight-args`).
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {"bold"},
                includes = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                types = {},
                operators = {"bold"},
            },

            -- Setting this to false disables all default file format highlights.
            -- Useful if you want to enable specific file format options.
            -- Defaults to false when treesitter is enabled,
            -- unless manually enabled inside the `setup()` function.
            default_fileformats = true,

            -- Setting this to false disables all default plugin highlights.
            -- Useful if you want to enable specific plugin options.
            default_plugins = true,

            -- For more fileformats options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Fileformats)
            fileformats = {
                c_cpp = true,
                c_sharp = true,
                cmake = true,
                css = true,
                git_commit = true,
                go = true,
                help = true,
                html = true,
                json = true,
                makefile = true,
                markdown = true,
                xml = true,
                yaml = true,
                zsh = true,
            },

            -- For more plugin options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Plugins)
            plugins = {
                gitsigns = true,
                fzf = true,
                alpha = true,
                lazy = true,
                lazygit = true,
                scrollbar = true,
                blink_cmp = false,
                mason = true,
                netrw = true,
                dadbod_ui = true,
                treesitter = true,
                mini = {
                    tabline = false
                },
                nvim_cmp = true,
                dashboard = false,
                git_gutter = false,
                indent_blankline = false,
                noice = false,
                notify = false,
                lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "bold", "italic" },
                        hints = { "bold", "italic" },
                        information = { "bold", "italic" },
                        ok = { "bold", "italic" },
                        warnings = { "bold", "italic" },
                        unnecessary = { "bold", "italic" },
                    },
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        information = { "undercurl" },
                        ok = { "undercurl" },
                        warnings = { "undercurl" },
                    },
                    inlay_hints = {
                        background = true,
                        style = { "bold", "italic" },
                    },
                },
            },
            custom_highlights = function(C)
                return {
                    all = {
                        TabLine = {
                            bg = C.none,
                            fg = C.color2,
                        },
                        TabLineSel = {
                            bg = C.none,
                            fg = C.foreground,
                            styles = { "bold" },
                        },
                    }
                }
            end

        })
        vim.cmd.colorscheme("neopywal")
    end
}
