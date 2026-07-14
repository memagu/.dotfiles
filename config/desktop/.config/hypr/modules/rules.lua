---------------
---- RULES ----
---------------

-------------------------
---- WORKSPACE RULES ----
-------------------------

hl.window_rule({ match = { class = "^(com.mitchellh.ghostty)$" }, workspace = 1 })
hl.window_rule({ match = { class = "^(librewolf)$" }, workspace = 2 })
hl.window_rule({ match = { class = "^(discord)$" }, workspace = 3 })
hl.window_rule({ match = { class = "^(steam)$" }, workspace = 9 })
hl.window_rule({ match = { class = "^(spotify)$" }, workspace = 10 })

---------------------
---- WINDOW RULES ----
---------------------

hl.window_rule({
	name = "hyprpolkitagent",
	match = { class = "^(hyprpolkitagent)$" },
	float = true,
	center = true,
	size = { "10%", "10%" },
	pin = true,
	stay_focused = true,
	dim_around = true,
})

hl.window_rule({
	name = "tuiapplet",
	match = { class = "^(com.memagu.tuiapplet)$" },
	float = true,
	center = true,
	size = { "55%", "55%" },
	pin = true,
	dim_around = true,
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

---------------------
---- LAYER RULES ----
---------------------

hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
