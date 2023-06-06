local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_prog = { '/home/linuxbrew/.linuxbrew/bin/zsh', '-l' }
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 12
config.color_scheme = 'nord'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

return config
