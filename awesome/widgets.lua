local lain = require('lain')
local keyboard_layout = require('modules.keyboard_layout')

local kbdcfg = keyboard_layout.kbdcfg({type = 'tui'})
kbdcfg.add_primary_layout('English', 'US', 'us')
kbdcfg.add_primary_layout('Persian', 'IR', 'ir')
kbdcfg.bind()

return {
	volume = lain.widget.pulsebar(
		{
			width = 40,
			ticks = true,
			ticks_size = 5
		}
	),
	mpd = lain.widget.mpd(),
	kbdcfg = kbdcfg
}
