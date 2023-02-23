-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")

local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")

local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors,
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then
      return
    end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err),
    })
    in_error = false
  end)
end
-- }}}

local function set_wallpaper(s)
  -- Wallpaper
  -- if beautiful.wallpaper then
  -- 	local wallpaper = beautiful.wallpaper
  -- 	-- If wallpaper is a function, call it with the screen
  -- 	if type(wallpaper) == 'function' then
  -- 		wallpaper = wallpaper(s)
  -- 	end
  -- 	gears.wallpaper.maximized(wallpaper, s, true)
  -- end
  awful.spawn.with_shell("feh --bg-fill ~/wallpaper/w21.jpg")
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

require("layouts")

require("menu")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

require("keys")

require("bar")

require("rules")

require("signals")

-- awful.spawn.with_shell("picom --experimental-backends")
awful.spawn.with_shell("feh --bg-fill ~/Pictures/Wallpapers/5.jpg")
awful.spawn.with_shell("unclutter idle 3 &")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("mpd && mpd-mpris")
awful.spawn.with_shell("greenclip daemon")
