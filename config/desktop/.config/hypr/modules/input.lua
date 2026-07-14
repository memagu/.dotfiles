---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "se",
		numlock_by_default = true,
		repeat_rate = 60,

		touchpad = {
			disable_while_typing = false,
			natural_scroll = true,
		},
	},
})

-----------------
---- DEVICES ----
-----------------

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
	accel_profile = "flat",
})

------------------
---- GESTURES ----
------------------

hl.config({
	gestures = {
		workspace_swipe_forever = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
	scale = 2.0,
})
