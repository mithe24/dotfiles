return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function ()
        require("fzf-lua").setup({
            winopts = {},
            keymap = {},
            actions = {},
            fzf_colors = {},
            hls = {},
            previewers = {},
        })
    end,
}
