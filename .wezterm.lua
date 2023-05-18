local wezterm = require('wezterm')
local c = wezterm.config_builder()

-- c.color_scheme = 'Snazzy'
c.color_scheme = 'tokyonight_night'
c.enable_scroll_bar = true
c.font = wezterm.font 'JetBrainsMono Nerd Font'
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = true
c.default_prog = { '/usr/local/bin/fish', '-l' }
c.window_padding = {
  left = 0,
  right = 0,
  bottom = 0,
  top = 0,
}

c.max_fps = 25
c.line_height = 1.3
c.automatically_reload_config = false
c.default_cursor_style = 'BlinkingBar'
c.cursor_blink_rate = 300

return c

