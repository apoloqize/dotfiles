-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Colors from github_dark_default theme
config.colors = {
    -- Default colors
    foreground = "#e6edf3",
    background = "#0A0D10",  -- Much darker to account for terminal rendering
    cursor_bg = "#e6edf3",
    cursor_border = "#e6edf3",
    cursor_fg = "#010409",
    selection_bg = "#264f78",
    selection_fg = "#e6edf3",
    
    -- ANSI colors from palette base colors
    ansi = {
        "#484f58",  -- black.base (gray[10])
        "#ff7b72",  -- red.base (red[4])
        "#3fb950",  -- green.base (green[4])
        "#d29922",  -- yellow.base (yellow[4])
        "#58a6ff",  -- blue.base (blue[4])
        "#bc8cff",  -- magenta.base (purple[4])
        "#76e3ea",  -- cyan.base
        "#6e7681",  -- white.base (gray[3])
    },

    -- Bright colors from palette bright colors
    brights = {
        "#6e7681",  -- black.bright (gray[9])
        "#ffa198",  -- red.bright (red[3])
        "#56d364",  -- green.bright (green[3])
        "#e3b341",  -- yellow.bright (yellow[3])
        "#79c0ff",  -- blue.bright (blue[3])
        "#d2a8ff",  -- magenta.bright (purple[3])
        "#b3f0ff",  -- cyan.bright
        "#f0f6fc",  -- white.bright (gray[3])
    },
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
-- and finally, return the configuration to wezterm
return config
