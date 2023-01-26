local awful   = require "awful"
local widgets = require "bar.widgets"

return {
	-- Mute the volume
    awful.key({}, "XF86AudioMute", function()
        awful.spawn "pactl set-sink-mute 0 toggle"
        widgets.volume.volume_timer:emit_signal "timeout"
    end,
    {description = "Mute volume", group = "control"}),

	-- Raise the volume
	awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn "pactl set-sink-volume 0 +10%"
        widgets.volume.volume_timer:emit_signal "timeout"
    end,
    {description = "Raise volume", group = "control"}),

	-- Lower the volume
	awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn "pactl set-sink-volume 0 -10%"
        widgets.volume.volume_timer:emit_signal "timeout"
    end,
    {description = "Lower volume", group = "control"}),

	-- Mute the microphone
	awful.key({}, "XF86AudioMicMute", function()
        awful.spawn "pactl set-source-mute 0 toggle"
    end,
    {description = "Mute microphone", group = "control"}),

	-- Increase brightness by 5%
	awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn "brightnessctl -e --device='amdgpu_bl0' s +5%"
        widgets.brightness.brightness_timer:emit_signal "timeout"
    end,
    {description = "Increase brightness by 5%", group = "control"}),

	-- Decrease brightness by 5%
	awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn "brightnessctl -e --device='amdgpu_bl0' s 5%-"
        widgets.brightness.brightness_timer:emit_signal "timeout"
    end,
    {description = "Decrease brightness by 5%", group = "control"}),

	-- Capture screen
    awful.key({}, "Print", function()
        awful.util.spawn_with_shell "scrot ~/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png"
        awful.util.spawn_with_shell "notify-send 'Scrot' 'Screen captured'"
    end,
    {description = "Capture screen", group = "control"}),

	-- Lock screen
	--[[ awful.key({}, "XF86Display", function()
        awful.spawn "dm-tool lock"
    end,
    {description = "Lock screen", group = "control"}), ]]
	awful.key({}, "XF86Display", function()
        awful.spawn "slock"
    end,
    {description = "Lock screen", group = "control"}),
}
