local awful = require 'awful'
local beautiful = require 'beautiful'
local gears = require 'gears'
local wibox = require 'wibox'
local keyboard_layout = require('modules.keyboard_layout')
local kbdcfg = keyboard_layout.kbdcfg({type = 'tui'})

local dpi = beautiful.xresources.apply_dpi

kbdcfg.add_primary_layout('English', 'US', 'us')
kbdcfg.add_primary_layout('Persian', 'IR', 'ir')
kbdcfg.bind()

-- {{{ Wibar

-- Create a wibox for each screen and add it
local taglist_buttons =
	gears.table.join(
	awful.button(
		{},
		1,
		function(t)
			t:view_only()
		end
	),
	awful.button(
		{modkey},
		1,
		function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end
	),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button(
		{modkey},
		3,
		function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end
	),
	awful.button(
		{},
		4,
		function(t)
			awful.tag.viewnext(t.screen)
		end
	),
	awful.button(
		{},
		5,
		function(t)
			awful.tag.viewprev(t.screen)
		end
	)
)

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

awful.screen.connect_for_each_screen(
	function(s)
		-- Wallpaper
		-- set_wallpaper(s)

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
		s.taglist =
			awful.widget.taglist(
			{
				screen = s,
				filter = awful.widget.taglist.filter.all,
				buttons = taglist_buttons,
				layout = {
					spacing = 4,
					layout = wibox.layout.fixed.horizontal
				}
			}
		)

		s.layoutbox = wibox.container.margin(awful.widget.layoutbox(s), 0, 5, 3, 3)

		-- Create a tasklist widget
		s.tasklist =
			awful.widget.tasklist(
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
			require('widgets.calendar').create(s),
			{
				layout = wibox.layout.fixed.horizontal,
				wibox.layout.margin(wibox.widget.systray(), dpi(5), dpi(5), dpi(0), dpi(0)),
				-- require('widgets.bluetooth'),
				wibox.layout.margin(kbdcfg.widget, dpi(5), dpi(5), dpi(3), dpi(3)),
				wibox.container.margin(awful.widget.layoutbox(s), dpi(5), dpi(5), dpi(3), dpi(3))
			}
		}
		-- s.panel =
		-- 	awful.wibar(
		-- 	{
		-- 		position = 'top',
		-- 		screen = s,
		-- 		opacity = 0.9,
		-- 		height = 21,
		-- 		width = 1410
		-- 	}
		-- )

		-- -- Add widgets to the wibox
		-- s.panel:setup {
		-- 	-- layout = wibox.layout.align.horizontal,
		-- 	-- {
		-- 	-- 	-- Left widgets
		-- 	-- 	-- layout = wibox.layout.fixed.horizontal,
		-- 	-- 	mylauncher,
		-- 	-- 	s.mytaglist,
		-- 	-- 	s.mypromptbox
		-- 	-- },
		-- 	-- s.mytasklist, -- Middle widget
		-- 	-- {
		-- 	-- 	-- Right widgets
		-- 	-- 	layout = wibox.layout.fixed.horizontal,
		-- 	-- 	-- mykeyboardlayout,
		-- 	-- 	kbdcfg.widget,
		-- 	-- 	wibox.widget.systray(),
		-- 	-- 	time,
		-- 	-- 	s.mylayoutbox
		-- 	-- },
		-- 	layout = wibox.layout.align.horizontal,
		-- 	expand = 'none',
		-- 	{
		-- 		{
		-- 			s.tasklist,
		-- 			left = 10,
		-- 			right = 10,
		-- 			widget = wibox.container.margin
		-- 		},
		-- 		layout = wibox.layout.fixed.horizontal
		-- 	},
		-- 	{
		-- 		s.taglist,
		-- 		layout = wibox.layout.fixed.horizontal
		-- 	},
		-- 	right_widgets(hostname, s)
		-- }
	end
)
-- }}}
