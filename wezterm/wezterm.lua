local wezterm = require "wezterm"

return {
  default_prog = { "/bin/bash", "-l", "-c", "tmux attach || tmux" },
  enable_tab_bar = false,
  font = wezterm.font_with_fallback {
    {
      family = "Cascadia Code PL",
      harfbuzz_features = { "ss01" },
    },
    {
      family = "Cascadia Code",
      harfbuzz_features = { "ss01" },
    },
    "Symbols Nerd Font",
    "Noto Sans CJK SC",
    "Noto Sans Symbols",
  },
  font_size = 14,
  custom_block_glyphs = false,
  warn_about_missing_glyphs = false,
  freetype_load_target = "HorizontalLcd",
  cursor_blink_rate = 0,
  color_scheme = "Catppuccin Mocha",
  initial_cols = 100,
  initial_rows = 45,
  -- window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
