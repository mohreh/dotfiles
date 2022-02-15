local keyboard_layout = require("modules.keyboard_layout")
local volume_widget = require("modules.awesome-wm-widgets.volume-widget.volume")
local mpris_widget = require("modules.awesome-wm-widgets.mpris-widget")

local kbdcfg = keyboard_layout.kbdcfg({ type = "tui" })
kbdcfg.add_primary_layout("English", "US", "us")
kbdcfg.add_primary_layout("Persian", "IR", "ir")
kbdcfg.bind()

return {
  volume_widget = volume_widget,
  mpris_widget = mpris_widget,
  kbdcfg = kbdcfg,
}
