local wezterm = require 'wezterm'
local home = os.getenv("HOME")
local config = wezterm.config_builder()

config.enable_wayland = false
config.font_size = 20
config.color_scheme_dirs = {home.."/.cache/wal"}
config.font = wezterm.font "Fira Code Nerd Font"
config.window_background_opacity = 0.8
config.warn_about_missing_glyphs = false
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.enable_tab_bar = false

return config
