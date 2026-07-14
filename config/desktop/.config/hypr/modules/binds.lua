---------------
---- BINDS ----
---------------

-----------------
---- GENERAL ----
-----------------

hl.bind("SUPER + Q", hl.dsp.exec_cmd("ghostty"), { description = "open terminal" })
hl.bind("SUPER + C", hl.dsp.window.close(), { description = "close active window" })
hl.bind(
	"SUPER + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	{ description = "exit Hyprland" }
)
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"), { description = "file manager" })
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }), { description = "toggle floating" })
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprlauncher"), { description = "app launcher" })
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { description = "pseudo tile" })
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"), { description = "toggle split" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen(), { description = "fullscreen" })

---------------
---- FOCUS ----
---------------

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }), { description = "focus left" })
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }), { description = "focus right" })
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }), { description = "focus up" })
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }), { description = "focus down" })

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

---------------------------
---- SPECIAL WORKSPACES ----
---------------------------

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"), { description = "toggle special workspace" })
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.window.move({ workspace = "special:magic", silent = true }),
	{ description = "move to special workspace" }
)

-------------------------
---- SCROLL WORKSPACE ----
-------------------------

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "scroll workspace up" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "scroll workspace down" })

----------------
---- RESIZE ----
----------------

hl.bind(
	"SUPER + SHIFT + right",
	hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
	{ repeating = true, description = "resize right" }
)
hl.bind(
	"SUPER + SHIFT + left",
	hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
	{ repeating = true, description = "resize left" }
)
hl.bind(
	"SUPER + SHIFT + up",
	hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
	{ repeating = true, description = "resize up" }
)
hl.bind(
	"SUPER + SHIFT + down",
	hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
	{ repeating = true, description = "resize down" }
)

--------------------
---- SCREENSHOTS ----
--------------------

hl.bind(
	"SUPER + SHIFT + P",
	hl.dsp.exec_cmd('hyprshot -m region --output-folder "$HOME/Pictures/screenshots"'),
	{ description = "screenshot region" }
)
hl.bind(
	"SUPER + SHIFT + O",
	hl.dsp.exec_cmd('hyprshot -m output -m eDP-1 --output-folder "$HOME/Pictures/screenshots"'),
	{ description = "screenshot monitor" }
)
hl.bind(
	"SUPER + SHIFT + I",
	hl.dsp.exec_cmd('hyprshot -m window --output-folder "$HOME/Pictures/screenshots"'),
	{ description = "screenshot window" }
)

--------------------------
---- TOGGLE HYPRLIDLE ----
--------------------------

hl.bind(
	"SUPER + SHIFT + L",
	hl.dsp.exec_cmd("$XDG_CONFIG_HOME/hypr/scripts/toggle-hypridle.sh"),
	{ description = "toggle hypridle" }
)

---------------
---- MOUSE ----
---------------

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "resize window" })

---------------
---- MEDIA ----
---------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
