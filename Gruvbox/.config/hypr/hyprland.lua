require "binds"
require "env"
require "animations"

-- Monitor config
hl.monitor({
	output   = "",
	mode     = "1920x1080@74.97Hz",
	position = "auto",
	scale    = "auto",
})

-- Autostart
hl.on("hyprland.start", function ()
	hl.exec_cmd("kitty")
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-- Config
hl.config({
	general = {
		gaps_in  = 5,
		gaps_out = 10,
		border_size = 0,
		layout = "dwindle",
		snap = {
			enabled = false,
		}
	},

	dwindle = {
		preserve_split = true,
	},

	decoration = {
		rounding = 0,

		active_opacity   = 1.0,
		inactive_opacity = 0.8,
		dim_inactive = true,
		dim_strength = 0.2,

		shadow = {
			enabled      = true,
			range        = 20,
			render_power = 4,
			color        = 0xee1a1a1a,
		},

		blur = {
			enabled   = true,
			popups = true,
			passes = 1,
			size = 1,
		},

		motion_blur = {
			enabled = true,
			samples = 64
		},

		wobble = {
			enabled = false,
			mesh = 16,
			stiffness = 600,
			damping = 36,
			mass = 1,
			intensity = 0.06,
			value_epsilon = 0.05,
			velocity_epsilon = 0.5,
        },
	},

	animations = {
		enabled = true,
	},

})


local suppressMaximizeRule = hl.window_rule({
	name  = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
	--     name  = "no-anim-overlay",
	--     match = { namespace = "^my-overlay$" },
	--     no_anim = true,
	-- })
	-- overlayLayerRule:set_enabled(false)

	-- Hyprland-run windowrule
	hl.window_rule({
		name  = "move-hyprland-run",
		match = { class = "hyprland-run" },

		move  = "20 monitor_h-120",
		float = true,
	})
--[[
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 35, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 5, gaps_in = 5 })
--]]
