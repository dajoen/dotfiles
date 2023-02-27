local wezterm = require 'wezterm'
return {
    font = wezterm.font 'FiraCode Nerd Font',
    font_size = 14,
    color_scheme = 'nord',
    use_fancy_tab_bar = true,
    window_decorations = "RESIZE",
    window_background_image = '/Users/jeroenverhoeven/.config/wezterm/unix.jpg',
    window_background_image_hsb = {
        brightness = 0.1,
        hue = 1.0,
        saturation = 0.8,
    },
    window_background_opacity = 0.90,
}
