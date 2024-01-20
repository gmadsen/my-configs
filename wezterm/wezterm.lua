-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.default_prog = { "/usr/bin/fish", "-l" }

config.font = wezterm.font_with_fallback({ "PragmataProMono Nerd Font", "JetBrains Mono" })
-- config.font = wezterm.font("JetBrains Mono")
config.font_size = 14
config.color_scheme = "nightfox"

config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.0
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
return config
