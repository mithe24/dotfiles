return {
    "norcalli/nvim-colorizer.lua",

    config = function ()
        require 'colorizer'.setup {
            '*'; -- Highlight all files, but customize some others.
            '!vim'; -- Exclude vim from highlighting.
            -- Exclusion Only makes sense if '*' is specified!
            --

            DEFAULT_OPTIONS = {
                RGB      = true;         -- #RGB hex codes
                RRGGBB   = true;         -- #RRGGBB hex codes
                names    = false;         -- "name" codes like Blue
                RRGGBBAA = true;         -- #RRGGBBAA hex codes
                rgb_fn   = true;         -- CSS rgb() and rgba() functions
                hsl_fn   = true;         -- CSS hsl() and hsla() functions
                css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
                mode     = 'background'; -- Set the display mode.
            }
        }
    end
}
