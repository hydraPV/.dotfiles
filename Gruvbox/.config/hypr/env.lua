-- Most of these are from the wiki https://wiki.hypr.land/configuring/core/environment-variables/

-- GTK / Cursor
hl.env("GTK_THEME", "Gruvbox")
hl.env("XCURSOR_THEME", "phinger-cursor")

-- Toolkit backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;qcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Qt
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
