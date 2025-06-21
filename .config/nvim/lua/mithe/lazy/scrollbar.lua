return {
    "petertriho/nvim-scrollbar",

    config = function ()
        require("scrollbar").setup({
            handle = {
                text = " ", -- character is just a visual; length is handled below
                blend = 0,
                hide_if_all_visible = false,
            },
            handlers = {
                cursor = false,
                diagnostic = false,
                gitsigns = false,
                search = false,
            },
            throttle_ms = 100,
        })
    end
}
