local wezterm = require 'wezterm'

local conig = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.window_background_opacity = 0.8

return config
