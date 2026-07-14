--------------------
---- ANIMATIONS ----
--------------------

----------------
---- CURVES ----
----------------

hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("workspaceSpring", { type = "spring", mass = 1, stiffness = 100, dampening = 14 })
hl.curve("windowSpring", { type = "spring", mass = 1, stiffness = 180, dampening = 16 })

--------------------
---- WORKSPACES ----
--------------------

hl.animation({ leaf = "workspaces", enabled = true, speed = 1, spring = "workspaceSpring", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1, spring = "workspaceSpring", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1, spring = "workspaceSpring", style = "slide" })

-----------------
---- WINDOWS ----
-----------------

hl.animation({ leaf = "windows", enabled = true, speed = 2, spring = "windowSpring" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, spring = "windowSpring", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, spring = "windowSpring", style = "popin 87%" })

--------------
---- FADE ----
--------------

hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1, bezier = "quick" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1, bezier = "quick" })

----------------
---- BORDER ----
----------------

hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "quick" })

----------------
---- LAYERS ----
----------------

hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "quick", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1, bezier = "quick", style = "fade" })
