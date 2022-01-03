local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')

-- beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')
beautiful.init(gears.filesystem.get_configuration_dir() .. 'theme.lua')

local bling = require('modules.bling')

-- This is used later as the default terminal and editor to run.
terminal = 'kitty'
editor = os.getenv('EDITOR') or 'nvim'
editor_cmd = terminal .. ' -e ' .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = 'Mod4'

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	-- awful.layout.suit.tile,
	-- awful.layout.suit.floating,
	bling.layout.mstab,
	bling.layout.centered,
	-- bling.layout.vertical,
	-- bling.layout.horizontal,
	bling.layout.equalarea,
	bling.layout.deck
	-- awful.layout.suit.tile.left,
	-- awful.layout.suit.tile.bottom,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.max,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.nw
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
