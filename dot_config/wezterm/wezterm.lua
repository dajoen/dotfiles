local wezterm = require 'wezterm'
return {
    font = wezterm.font 'FiraCode Nerd Font',
    font_size = 14,
    color_scheme = 'nord',
    use_fancy_tab_bar = true,
    window_decorations = "RESIZE",
    window_background_image = '/Users/jeroenverhoeven/.config/wezterm/unix.jpg',
    window_background_hsb = {
        brightness = 0.3,
        hue = 0.7,
        saturation = 0.3,
    },
    window_background_opacity = 0.90,
}
