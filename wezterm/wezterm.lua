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
  custom_block_glyphs = false,
  freetype_load_target = "HorizontalLcd",
  default_cursor_style = "BlinkingBar",
  color_scheme = "catppuccin",
  colors = require "catppuccin",
  initial_cols = 140,
  initial_rows = 50,
  -- window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
