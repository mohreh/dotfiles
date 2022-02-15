local keyboard_layout = require("keyboard_layout")
local volume_widget = require("bar.widgets.volume-widget.volume")

local kbdcfg = keyboard_layout.kbdcfg({ type = "tui" })
kbdcfg.add_primary_layout("English", "US", "us")
kbdcfg.add_primary_layout("Persian", "IR", "ir")
kbdcfg.bind()

return {
  volume_widget = volume_widget,
  kbdcfg = kbdcfg,
}
