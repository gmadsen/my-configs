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
--
-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }
-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "nightfox"

-- and finally, return the configuration to wezterm
return config
