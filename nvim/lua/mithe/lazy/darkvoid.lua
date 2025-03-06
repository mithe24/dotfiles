--darkvoid colorscheme
return {
  'aliqyan-21/darkvoid.nvim',

  config = function()
    -- Configuration for darkvoid theme
    require('darkvoid').setup({
      transparent = false,
      glow = true,
      show_end_of_buffer = true,

      colors = {
        fg = "#c0c0c0",
        bg = "#0a0a0a",
        cursor = "#bdfe58",
        line_nr = "#404040",
        visual = "#303030",
        comment = "#666666",
        string = "#ccc800",
        func = "#009999",
        kw = "#ffffff",
        identifier = "#b1b1b1",
        type = "#00cc00", --00CC00
        type_builtin = "#ffffff", -- current
        search_highlight = "#FFFF63",
        operator = "#ffffff",
        bracket = "#ffffff",
        preprocessor = "#ffffff",
        bool = "#b1b1b1",
        constant = "#b1b1b1",

        -- enable or disable specific plugin highlights
        plugins = {
            gitsigns = true,
            nvim_cmp = true,
            treesitter = true,
            nvimtree = false,
            telescope = true,
            lualine = false,
            bufferline = false,
            oil = false,
            whichkey = false,
            nvim_notify = false,
        },

        -- gitsigns colors
        added = "#f1f1f1",
        changed = "#709cd1",
        removed = "#e76f6f",

        -- Pmenu colors
        pmenu_bg = "#1c1c1c",
        pmenu_sel_bg = "#1bfd9c",
        pmenu_fg = "#c0c0c0",

        -- EndOfBuffer color
        eob = "#3c3c3c",

        -- Telescope specific colors
        border = "#585858",
        title = "#bdfe58",

        -- bufferline specific colors
        bufferline_selection = "#1bfd9c",

        -- LSP diagnostics colors
        error = "#e76f6f",
        warning = "#FFFF63",
        hint = "#bdfe58",
        info = "#7fa1c3",
      },
    })
  end
}
