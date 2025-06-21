c = c
config = config
config.load_autoconfig()

def hex_to_rgba(hex_color, alpha):
    hex_color = hex_color.lstrip("#")
    r, g, b = int(hex_color[0:2], 16), int(hex_color[2:4], 16), int(hex_color[4:6], 16)
    return f"rgba({r}, {g}, {b}, {alpha})"

# Loading xresources
import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(["xrdb", "-query"], capture_output=True, check=True, text=True)
    lines = x.stdout.split("\n")
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props
xresources = read_xresources("*")

###### STYLE ######
c.colors.statusbar.normal.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.statusbar.command.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.statusbar.insert.bg = hex_to_rgba(xresources["*.color8"], 0.8)
c.colors.statusbar.caret.bg = hex_to_rgba(xresources["*.color8"], 0.8)
c.colors.statusbar.command.fg = xresources["*.color13"]
c.colors.statusbar.insert.fg = xresources["*.color13"]
c.colors.statusbar.caret.fg = xresources["*.color13"]
c.colors.statusbar.normal.fg = xresources["*color13"]
c.colors.statusbar.passthrough.fg = xresources["*color14"]
c.colors.statusbar.url.fg = xresources["*color13"]
c.colors.statusbar.url.success.https.fg = xresources["*color13"]
c.colors.statusbar.url.hover.fg = xresources["*color12"]
c.colors.tabs.even.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.tabs.odd.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.tabs.bar.bg = hex_to_rgba(xresources["*.background"], 0.0)
c.colors.tabs.even.fg = xresources["*.foreground"]
c.colors.tabs.odd.fg = xresources["*.foreground"]
c.colors.tabs.selected.even.bg = hex_to_rgba(xresources["*color1"], 0.8)
c.colors.tabs.selected.odd.bg = hex_to_rgba(xresources["*color1"], 0.8)
c.colors.tabs.selected.even.fg = xresources["*.background"]
c.colors.tabs.selected.odd.fg = xresources["*.background"]
c.colors.hints.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.hints.fg = xresources["*.foreground"]
c.tabs.show = "multiple"

c.colors.tabs.indicator.start = xresources["*color10"]
c.colors.tabs.indicator.stop = xresources["*color8"]
c.colors.completion.even.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.completion.odd.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.completion.fg = xresources["*.foreground"]
c.colors.completion.category.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.completion.category.fg = xresources["*.foreground"]
c.colors.completion.item.selected.bg = hex_to_rgba(xresources["*color1"], 0.8)
c.colors.completion.item.selected.fg = xresources["*.background"]
c.colors.completion.item.selected.match.fg = xresources["*color6"]
c.colors.completion.item.selected.border.top = xresources["*color1"]
c.colors.completion.item.selected.border.bottom = xresources["*color1"]
c.colors.completion.match.fg = xresources["*color6"]

c.colors.messages.info.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.messages.info.fg = xresources["*.foreground"]
c.colors.messages.error.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.messages.error.fg = xresources["*.foreground"]
c.colors.downloads.error.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.downloads.error.fg = xresources["*.foreground"]

c.colors.downloads.bar.bg = hex_to_rgba(xresources["*.background"], 0.8)
c.colors.downloads.start.bg = hex_to_rgba(xresources["*.color10"], 0.8)
c.colors.downloads.start.fg = xresources["*.foreground"]
c.colors.downloads.stop.bg = hex_to_rgba(xresources["*.color8"], 0.8)
c.colors.downloads.stop.fg = xresources["*.foreground"]

c.colors.tooltip.bg = xresources["*.background"]
c.colors.webpage.bg = xresources["*.background"]
c.hints.border = xresources["*.foreground"]

c.url.start_pages = "https://start.duckduckgo.com/"
c.url.default_page = "https://start.duckduckgo.com/"

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.tabs.padding = {"top": 5, "bottom": 5, "left": 9, "right": 9}
c.tabs.indicator.width = 0
c.window.transparent = True
c.tabs.width = "7%"

# fonts
c.fonts.default_family = []
c.fonts.default_size = "13pt"
c.fonts.web.family.fixed = "Fira Code Nerd Font"
c.fonts.web.family.sans_serif = "Fira Code Nerd Font"
c.fonts.web.family.serif = "Fira Code Nerd Font"
c.fonts.web.family.standard = "Fira Code Nerd Font"

###### KEYBINDINGS ######
config.bind("zr", "config-source")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind("<Shift-r>", "reload", mode="command")

config.bind("<Alt-h>", "back", mode="normal")
config.bind("<Alt-l>", "forward", mode="normal")
config.bind("<Ctrl-c>", "mode-leave", mode="command")
config.bind("gJ", "tab-move +")
config.bind("gK", "tab-move -")
config.bind("gt", "tab-next")
config.bind("gT", "tab-prev")

###### DARK MODE ######
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"
config.set("colors.webpage.darkmode.enabled", False, "file://*")

###### PRIVACY ######
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

c.auto_save.session = True
c.content.blocking.enabled = True
