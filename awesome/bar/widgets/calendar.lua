--       ██████╗ █████╗ ██╗     ███████╗███╗   ██╗██████╗  █████╗ ██████╗
--      ██╔════╝██╔══██╗██║     ██╔════╝████╗  ██║██╔══██╗██╔══██╗██╔══██╗
--      ██║     ███████║██║     █████╗  ██╔██╗ ██║██║  ██║███████║██████╔╝
--      ██║     ██╔══██║██║     ██╔══╝  ██║╚██╗██║██║  ██║██╔══██║██╔══██╗
--      ╚██████╗██║  ██║███████╗███████╗██║ ╚████║██████╔╝██║  ██║██║  ██║
--       ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local calendar = {}

-- ===================================================================
-- Create Widget
-- ===================================================================

calendar.create = function(screen)
	-- Clock / Calendar 12h format
	-- Get Time/Date format using `man strftime`
	local clock_widget = wibox.widget.textclock("<span font='" .. beautiful.title_font .. "'>%l:%M %p</span>", 1)

	-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
	-- awful.tooltip(
	-- 	{
	-- 		objects = {clock_widget},
	-- 		mode = 'outside',
	-- 		align = 'right',
	-- 		timer_function = function()
	-- 			return os.date('The date today is %B %d, %Y.')
	-- 		end,
	-- 		preferred_positions = {'right', 'left', 'top', 'bottom'},
	-- 		margin_leftright = dpi(8),
	-- 		margin_topbottom = dpi(8)
	-- 	}
	-- )

	local cal_shape = function(cr, width, height)
		gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, 12)
	end

	-- Calendar Widget
	local month_calendar =
		awful.widget.calendar_popup.month(
		{
			screen = screen,
			start_sunday = true,
			spacing = 10,
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 4)
			end,
			font = beautiful.title_font,
			long_weekdays = false,
			margin = 0, -- 10
			border_width = 1,
			border_color = beautiful.bg_focus,
			style_month = {border_width = 0, padding = 12, shape = cal_shape, padding = 25},
			style_header = {border_width = 0, bg_color = '#00000000'},
			style_weekday = {border_width = 0, bg_color = '#00000000'},
			style_normal = {border_width = 0, bg_color = '#00000000'},
			style_focus = {border_width = 0, bg_color = beautiful.bg_urgent}
		}
	)

	-- Attach calentar to clock_widget
	month_calendar:attach(clock_widget, 'tc', {on_pressed = true, on_hover = true})

	return clock_widget
end

return calendar