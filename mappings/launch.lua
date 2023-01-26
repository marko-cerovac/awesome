local awful = require "awful"

return {
    -- Terminal
    awful.key({ modkey }, "Return", function()
        awful.spawn(terminal)
    end,
    {description = "open a terminal", group = "launcher"}),

	-- St
    awful.key({ modkey }, "t", function()
        awful.spawn "st"
    end,
    {description = "Launch st terminal", group = "launcher"}),

	-- VS Codium
    awful.key({ modkey }, "c", function()
        awful.spawn "codium"
    end,
    {description = "Launch VS Codium", group = "launcher"}),

	-- NeoVide
    awful.key({ modkey }, "v", function()
        awful.spawn "neovide"
    end,
    {description = "Launch NeoVide", group = "launcher"}),

	-- NeoVim
    awful.key({ modkey }, "v", function()
        awful.spawn "alacritty -e nvim"
    end,
    {description = "Launch NeoVim", group = "launcher"}),

    -- Dmenu
    awful.key({ modkey }, "r", function()
        awful.spawn "j4-dmenu-desktop --dmenu='dmenu -c -l 10 -p Run:'"
    end,
    {description = "Launch Dmenu run prompt", group = "launcher"}),

    -- Dmenu
    awful.key({ modkey }, ";", function()
        awful.spawn "dmenu_run -c -l 10 -p Run:"
    end,
    {description = "Launch Dmenu run prompt", group = "launcher"}),

    -- File manager
    awful.key({ modkey }, "e", function()
        awful.spawn "alacritty -e ranger"
    end,
    {description = "Launch Ranger file manager", group = "launcher"}),

    -- Thunar
    awful.key({ modkey }, "n", function()
        awful.spawn "thunar"
    end,
    {description = "Launch Thunar file manager", group = "launcher"}),

    -- Brave
    awful.key({ modkey }, "b", function()
        awful.spawn("brave")
    end,
    {description = "Launch Brave browser", group = "launcher"}),

    awful.key({ modkey }, "i", function()
        awful.spawn "brave --incognito"
    end,
    {description = "Launch Brave browser (incognito mode)", group = "launcher"}),

    -- Pavucontrol
    awful.key({ modkey }, "p", function()
        awful.spawn "pavucontrol"
    end,
    {description = "Launch Pavucontrol volume control", group = "launcher"}),

    -- Change wallpaper
    awful.key({ modkey }, "y", function()
        awful.util.spawn_with_shell(utils .. "wallpaper-picker.sh")
    end,
    {description = "Change wallpaper", group = "launcher"}),
    --[[ awful.key({ modkey }, "y", function()
        awful.util.spawn_with_shell(utils .. "chwall.sh")
    end, ]]

    -- Change keyboard layout
    awful.key({ modkey }, "0", function()
        awful.util.spawn_with_shell(utils .. "kbdswitch.sh")
    end,
    {description = "Change keyboard layout", group = "launcher"}),

	-- Todo list
    awful.key({ modkey }, "9", function()
        awful.spawn(utils .. "todo.sh")
    end,
    {description = "Open todo list", group = "launcher"}),

    -- Poweroff menu
    awful.key({ modkey }, "x", function()
        awful.spawn(scripts .. "logout.sh")
    end,
    {description = "Shut down", group = "awesome"})
}
