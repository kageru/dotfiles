-- Hyprland 0.57 configuration migrated from ~/.config/sway/config.
-- Documentation: https://wiki.hypr.land/configuring/

local mainMod = "SUPER"
local terminal = "alacritty"
local menu = "wofi --show run"

-------------------
-- MONITORS / WALLPAPER
-------------------

hl.monitor({ output = "DP-1", mode = "2560x1440@240", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@144", position = "2560x0", scale = 1 })

hl.env("XCURSOR_THEME", "Oxygen_Zion")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-------------------
-- APPEARANCE / INPUT
-------------------

hl.config({
    general = {
        gaps_in = 8,
        -- Keep the screen edge available for easy titlebar and tab-bar targeting.
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(e2aa5eff)", "rgba(d99b4eff)" }, angle = 45 },
            inactive_border = "rgba(79563bff)",
            nogroup_border = "rgba(c56843ff)",
            nogroup_border_active = "rgba(e2aa5eff)",
        },
        layout = "dwindle",
        resize_on_border = false,
    },
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = { enabled = false },
        blur = { enabled = false },
    },
    input = {
        kb_layout = "de",
        kb_variant = "neo_qwertz",
        repeat_delay = 250,
        repeat_rate = 40,
        sensitivity = 0,
        accel_profile = "flat",
        touchpad = { natural_scroll = false },
        -- Sway's map_to_output target, applied to the configured tablet devices.
        tablet = { output = "DP-1" },
    },
    binds = { workspace_back_and_forth = 1 },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },
})

hl.config({ dwindle = { preserve_split = true } })

-- Keep group titles readable over any wallpaper, with an opaque warm tab bar.
hl.config({
    group = {
        groupbar = {
            font_size = 14,
            height = 24,
            text_padding = 8,
            gradients = true,
            text_color = "rgba(f5e6d3ff)",
            text_color_inactive = "rgba(d5c2adff)",
            col = {
                active = "rgba(30251f80)",
                inactive = "rgba(493a2f80)",
                locked_active = "rgba(30251f80)",
                locked_inactive = "rgba(493a2f80)",
            },
        },
    },
})

-- Retain the dark chestnut / amber palette and add a short focus-opacity fade.
hl.curve("warmEase", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.animation({ leaf = "global", enabled = true, speed = 4, bezier = "warmEase" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 3, bezier = "warmEase" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3, bezier = "warmEase" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "warmEase" })
hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "warmEase", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "warmEase", style = "fade" })

-------------------
-- WINDOW RULES
-------------------

hl.window_rule({ name = "float-mpv", match = { class = "mpv" }, float = true })
hl.window_rule({ name = "float-feh", match = { class = "feh" }, float = true })
hl.window_rule({ name = "float-sxiv", match = { class = "sxiv" }, float = true })
hl.window_rule({ name = "float-ygo-omega", match = { title = "YGO Omega" }, float = true })
hl.window_rule({ name = "qutebrowser-no-border", match = { class = "org.qutebrowser.qutebrowser" }, border_size = 0 })
hl.window_rule({ name = "float-border-size", match = { float = true }, border_size = 3 })
hl.window_rule({
    name = "alacritty-focus-opacity",
    match = { class = "Alacritty" },
    opacity = "0.95 override 0.70 override",
})
hl.window_rule({
    name = "no-initial-focus-jetbrains",
    match = { class = "jetbrains-.*" },
    no_initial_focus = true,
})
hl.window_rule({
    name = "no-initial-focus-discord",
    match = { class = "(?i).*discord.*" },
    no_initial_focus = true,
})

-------------------
-- STARTUP
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -i /home/kageru/Pictures/bg_town.jpg -m fill")
    hl.exec_cmd("waybar -c /home/kageru/.config/waybar/config-hypr")
    hl.exec_cmd("mako")
    hl.exec_cmd("gammastep -t 6500:3200 -l 54:10")
    hl.exec_cmd("swayidle -w timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -e -f -c 000000' after-resume /home/kageru/bin/tunnel")
    -- Preserve the Sway startup mount without running its unrelated temp cleanup.
    hl.exec_cmd("if command -v sshfs >/dev/null 2>&1 && ! mountpoint -q /mnt/lain; then sshfs -i ~/.ssh/lain lain:/home/kgt/download /mnt/lain -C; fi")
end)

-------------------
-- KEYBINDINGS
-------------------

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind("CTRL + SHIFT + 4", hl.dsp.exec_cmd("/home/kageru/bin/ppsh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("/home/kageru/.config/hypr/window-switcher.sh"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.pin())
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("alacritty -e ranger"))
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("alacritty -o font.size=16 -e ncmpcpp"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd([[mpv --force-window=immediate --gpu-context=wayland --player-operation-mode=pseudo-gui --profile=db -- "$(wl-paste)"]]))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("mpc toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("mpc next"), { locked = true })
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("mpc next"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mainMod .. " + SHIFT + C", function()
    hl.dispatch(hl.dsp.reload_config())
    hl.exec_cmd("pkill -x waybar >/dev/null 2>&1 || true; sleep 0.25; waybar -c /home/kageru/.config/waybar/config-hypr")
end)

-- Window focus and movement, retaining the Sway home-row and arrow-key pairs.
local directions = {
    h = "left", j = "down", k = "up", l = "right",
    left = "left", down = "down", up = "up", right = "right",
}
for key, direction in pairs(directions) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
    -- Like Sway's move-into-container behavior, directional moves also
    -- insert/remove windows from adjacent Hyprland groups.
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction, group_aware = true }))
end

for i = 1, 9 do
    local key = tostring(i)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

hl.bind(mainMod .. " + B", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.window.move({ workspace = "previous", follow = true }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", function()
    local window = hl.get_active_window()
    if not window then return end
    hl.dispatch(hl.dsp.window.cycle_next({
        floating = not window.floating,
        tiled = window.floating,
    }))
end, { description = "Switch focus between tiled and floating windows" })
hl.bind(mainMod .. " + A", hl.dsp.focus({ last = true }))
hl.bind(mainMod .. " + G", hl.dsp.layout("preselect l"))
hl.bind(mainMod .. " + V", hl.dsp.layout("preselect d"))
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))
-- Hyprland has no i3-style stacking layout; groups are its closest equivalent.
-- Super+S toggles the focused window into/out of a tabbed group, and Super+W
-- cycles through that group's windows.
hl.bind(mainMod .. " + S", hl.dsp.group.toggle())
hl.bind(mainMod .. " + W", hl.dsp.group.next())
hl.bind(mainMod .. " + U", hl.dsp.window.set_prop({ prop = "border_size", value = 0 }))
hl.bind(mainMod .. " + Y", hl.dsp.window.set_prop({ prop = "border_size", value = 3 }))
hl.bind(mainMod .. " + MINUS", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + MINUS", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Drag and resize windows with Mod + mouse buttons.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Power submap preserves the Sway lock / exit / sleep / hibernate / reboot choices.
local function systemAction(command)
    return function()
        hl.exec_cmd(command)
        hl.dispatch(hl.dsp.submap("reset"))
    end
end

hl.bind(mainMod .. " + 0", hl.dsp.submap("system"))
hl.define_submap("system", function()
    hl.bind("l", systemAction("swaylock -e -f -c 000000"))
    hl.bind("e", systemAction("hyprshutdown"))
    hl.bind("s", systemAction("systemctl suspend -i"))
    hl.bind("h", systemAction("systemctl hibernate -i"))
    hl.bind("r", systemAction("systemctl reboot"))
    hl.bind("SHIFT + S", systemAction("systemctl poweroff"))
    hl.bind("return", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("catchall", hl.dsp.submap("reset"))
end)

-- Resize mode, with the same 10-pixel home-row and arrow-key increments.
local resizeDirections = {
    h = { -10, 0 }, j = { 0, 10 }, k = { 0, -10 }, l = { 10, 0 },
    left = { -10, 0 }, down = { 0, 10 }, up = { 0, -10 }, right = { 10, 0 },
}
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    for key, delta in pairs(resizeDirections) do
        hl.bind(key, hl.dsp.window.resize({ x = delta[1], y = delta[2], relative = true }), { repeating = true })
    end
    hl.bind("return", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("catchall", hl.dsp.submap("reset"))
end)
