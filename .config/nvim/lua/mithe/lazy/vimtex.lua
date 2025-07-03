return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"

    -- Optional: Prevents Zathura race condition (helps avoid opening before PDF is ready)
    vim.g.vimtex_view_automatic = 0

    -- Optional: Forward search config (not always needed)
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex @pdf"
  end,
}

