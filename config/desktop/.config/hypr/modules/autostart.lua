hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprlauncher -d")
	hl.exec_cmd("$HOME/.local/bin/battery-notifications.sh")

	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)
