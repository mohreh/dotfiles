local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi
local awful = require "awful"
local gears = require "gears"

-- define module table
local theme = {}

-- ===================================================================
-- Theme Variables
-- ===================================================================

-- theme.name = cobalt next
theme.darker_bg = "#10171e"
theme.lighter_bg = "#1f272e"
theme.xbackground = "#131a21"
theme.xforeground = "#ffffff"
theme.xcolor0 = "#29343d"
theme.xcolor1 = "#f9929b"
theme.xcolor2 = "#7ed491"
theme.xcolor3 = "#fbdf90"
theme.xcolor4 = "#a3b8ef"
theme.xcolor5 = "#ccaced"
theme.xcolor6 = "#9ce5c0"
theme.xcolor7 = "#ffffff"
theme.xcolor8 = "#3b4b58"
theme.xcolor9 = "#fca2aa"
theme.xcolor10 = "#a5d4af"
theme.xcolor11 = "#fbeab9"
theme.xcolor12 = "#bac8ef"
theme.xcolor13 = "#d7c1ed"
theme.xcolor14 = "#c7e5d6"
theme.xcolor15 = "#eaeaea"

-- Font
theme.font = "Ubuntu Mono Semibold 9"
theme.title_font = "Ubuntu Mono 9"

-- Background
theme.bg_normal = theme.xbackground
theme.bg_dark = theme.xcolor0
theme.bg_light = "#232530"
theme.bg_focus = theme.xcolor0
theme.bg_urgent = theme.xcolor8
theme.bg_minimize = theme.xcolor8
theme.bg_systray = theme.darker_bg

-- Foreground
theme.fg_normal = theme.xcolor7
theme.fg_dark = "#cccccc"
theme.fg_focus = theme.xcolor4
theme.fg_urgent = theme.xcolor3
theme.fg_minimize = theme.xcolor8

-- Gaps
theme.useless_gap = dpi(5)
theme.gap_single_client = true

-- Corner Radius of Rounded Windows
theme.corner_radius = dpi(3)

-- Window Borders
theme.border_width = dpi(2)
theme.border_normal = theme.darker_bg
theme.border_focus = theme.bg_urgent
theme.border_radius = dpi(3)
theme.client_radius = dpi(12)

-- Wibar
theme.bar_position = "top"
theme.bar_opacity = dpi(0.5)

-- Taglist
theme.taglist_bg_focus = theme.lighter_bg
theme.taglist_fg_focus = theme.xcolor6
theme.taglist_bg_urgent = theme.wibar_bg
theme.taglist_fg_urgent = theme.xcolor6
theme.taglist_bg_occupied = theme.wibar_bg
theme.taglist_fg_occupied = theme.xcolor6
theme.taglist_bg_empty = theme.wibar_bg
theme.taglist_fg_empty = theme.xcolor8

-- Tasklist
theme.tasklist_font = theme.font

theme.tasklist_bg_urgent = theme.xcolor0
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_bg_focus = theme.lighter_bg
theme.tasklist_fg_focus = theme.xcolor6
theme.tasklist_bg_minimize = theme.xcolor0 .. 55
theme.tasklist_fg_minimize = theme.xforeground .. 55
theme.tasklist_bg_normal = theme.darker_bg
theme.tasklist_fg_normal = theme.xforeground

-- Panel Sizing
theme.top_panel_height = dpi(25)

-- Notification Sizing
theme.notification_max_width = dpi(350)

-- System Tray
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = dpi(5)

-- Titlebars
theme.titlebars_enabled = false

-- icons
-- theme.icon_theme = "Tela-dark"

theme.taglist_text_empty = { "", "", "", "", "", "", "", "", "", "" }
theme.taglist_text_occupied = { "", "", "", "", "", "", "", "", "", "" }
theme.taglist_text_focused = { "", "", "", "", "", "", "", "", "", "" }
theme.taglist_text_urgent = { "", "", "", "", "", "", "", "", "", "" }

theme.taglist_text_color_empty = {
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
  theme.xcolor0,
}
theme.taglist_text_color_occupied = {
  theme.xcolor1,
  theme.xcolor2,
  theme.xcolor3,
  theme.xcolor4,
  theme.xcolor5,
  theme.xcolor6,
  theme.xcolor1,
  theme.xcolor2,
  theme.xcolor3,
  theme.xcolor4,
}
theme.taglist_text_color_focused = {
  theme.xcolor1,
  theme.xcolor2,
  theme.xcolor3,
  theme.xcolor4,
  theme.xcolor5,
  theme.xcolor6,
  theme.xcolor1,
  theme.xcolor2,
  theme.xcolor3,
  theme.xcolor4,
}
theme.taglist_text_color_urgent = {
  theme.xcolor9,
  theme.xcolor10,
  theme.xcolor11,
  theme.xcolor12,
  theme.xcolor13,
  theme.xcolor14,
  theme.xcolor9,
  theme.xcolor10,
  theme.xcolor11,
  theme.xcolor12,
}

return theme
