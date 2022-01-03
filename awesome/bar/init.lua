local awful = require 'awful'
local beautiful = require 'beautiful'
local gears = require 'gears'
local wibox = require 'wibox'

local dpi = beautiful.xresources.apply_dpi

-- {{{ Widgets
local logout = require('bar.widgets.logout-menu')
local widgets = require('widgets')
local volume = widgets.volume

local kbdcfg = widgets.kbdcfg
-- }}}

-- {{{ Wibar

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
	function(s)
		-- Each screen has its own tag table.
		awful.tag({'1', '2', '3', '4', '5', '6', '7', '8', '9'}, s, awful.layout.layouts[1])

		-- Create a promptbox for each screen
		s.mypromptbox = awful.widget.prompt()
		-- Create an imagebox widget which will contain an icon indicating which layout we're using.
		-- We need one layoutbox per screen.
		s.mylayoutbox = awful.widget.layoutbox(s)
		s.mylayoutbox:buttons(
			gears.table.join(
				awful.button(
					{},
					1,
					function()
						awful.layout.inc(1)
					end
				),
				awful.button(
					{},
					3,
					function()
						awful.layout.inc(-1)
					end
				),
				awful.button(
					{},
					4,
					function()
						awful.layout.inc(1)
					end
				),
				awful.button(
					{},
					5,
					function()
						awful.layout.inc(-1)
					end
				)
			)
		)
		
		-- Create a taglist widget
		s.taglist = require('bar.taglist')(s)

		s.layoutbox = wibox.container.margin(awful.widget.layoutbox(s), dpi(5), dpi(5), dpi(4.5), dpi(4.5))

		-- Create a tasklist widget
		s.tasklist = require('bar.tasklist')(s)

		-- Create the wibox
		local panel =
			awful.wibar(
			{
				screen = s,
				position = 'top',
				ontop = true,
				height = beautiful.top_panel_height,
				opacity = 0.9,
				width = s.geometry.width - 30
			}
		)

		panel:setup {
			expand = 'none',
			layout = wibox.layout.align.horizontal,
			{
				layout = wibox.layout.align.horizontal,
				wibox.layout.margin(s.taglist, dpi(3), dpi(10), dpi(3), dpi(3)),
				wibox.layout.margin(s.tasklist, dpi(2), dpi(10), dpi(2), dpi(2))
			},
			require('bar.widgets.calendar').create(s),
			{
				layout = wibox.layout.fixed.horizontal,
				wibox.layout.margin(wibox.widget.systray(), dpi(5), dpi(5), dpi(0), dpi(0)),
				wibox.layout.margin(kbdcfg.widget, dpi(5), dpi(0), dpi(3), dpi(3)),
				wibox.container.margin(awful.widget.layoutbox(s), dpi(5), dpi(5), dpi(4.5), dpi(4.5)),
				wibox.layout.margin(logout(), dpi(5), dpi(5), dpi(5), dpi(5))
			}
		}
	end
)
-- }}}
