hl.config({
	general = {
		border_size = 4,

		gaps_in = 4,
		gaps_out = 8,

		col = {
			inactive_border = "rgba(595959dd)",
			active_border = { colors = { "rgba(f280a1dd)", "rgba(9966ccdd)" }, angle = 45 },
		},
	},

	decoration = {
		rounding = 10,
		inactive_opacity = 0.95,

		shadow = {
			enabled = false,
		},

		blur = {
			size = 4,
			passes = 2,
		},
	},

	xwayland = {
		force_zero_scaling = true,
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		font_family = "Iosevka Nerd Font Mono",
		force_default_wallpaper = 0,
	},
})
