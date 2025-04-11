return {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup({
        copy_sync = {
        -- enables copy sync. by default, all registers are synchronized.
        -- to control which registers are synced, see the `sync_*` options.
        enable = false,
        },
    })
    end
}
