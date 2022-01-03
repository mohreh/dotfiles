local awful = require 'awful'
local beautiful = require 'beautiful'
local gears = require 'gears'
local wibox = require 'wibox'

local tasklist_buttons =
	gears.table.join(
	awful.button(
		{},
		1,
		function(c)
			if c == client.focus then
				c.minimized = true
			else
				c:emit_signal('request::activate', 'tasklist', {raise = true})
			end
		end
	),
	awful.button(
		{},
		3,
		function()
			awful.menu.client_list({theme = {width = 250}})
		end
	),
	awful.button(
		{},
		4,
		function()
			awful.client.focus.byidx(1)
		end
	),
	awful.button(
		{},
		5,
		function()
			awful.client.focus.byidx(-1)
		end
	)
)

return awful.widget.tasklist(
	{
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		layout = {
			spacing_widget = {
				{
					forced_width = 5,
					forced_height = 21,
					thickness = 2,
					color = beautiful.tasklist_separator,
					widget = wibox.widget.separator
				},
				valign = 'center',
				halign = 'center',
				widget = wibox.container.place
			},
			spacing = 30,
			layout = wibox.layout.fixed.horizontal
		},
		widget_template = {
			{
				{
					{
						{
							id = 'icon_role',
							widget = wibox.widget.imagebox
						},
						margins = 2,
						widget = wibox.container.margin
					},
					layout = wibox.layout.fixed.horizontal
				},
				left = 7,
				right = 7,
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background
		}
	}
)
