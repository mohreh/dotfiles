local wibox = require("wibox")

local widget = {}

function widget.get_widget(widgets_args)
  local args = widgets_args or {}

  local volume_icon_name
  return wibox.widget({
    {
      id = "icon",
      -- resize = false,
      font = "Ubuntu Mono 18",
      widget = wibox.widget.textbox,
      markup = "ﱝ",
    },
    valign = "center",
    layout = wibox.container.place,
    set_volume_level = function(self, new_value)
      if self.is_muted then
        volume_icon_name = "ﱝ"
      else
        local new_value_num = tonumber(new_value)
        if new_value_num >= 0 and new_value_num < 33 then
          volume_icon_name = ""
        elseif new_value_num < 66 then
          volume_icon_name = ""
        else
          volume_icon_name = ""
        end
      end
      self:get_children_by_id("icon")[1]:set_text(volume_icon_name)
    end,
    mute = function(self)
      self.is_muted = true
      self:get_children_by_id("icon")[1]:set_text(volume_icon_name)
      -- self:get_children_by_id("icon")[1]:set_image(icon_dir .. "audio-volume-muted-symbolic.svg")
    end,
    unmute = function(self)
      self.is_muted = false
    end,
  })
end

return widget
