local bind = hl.bind

hl.config({
	input = {
		kb_layout  = "es",

		accel_profile = "flat",
		follow_mouse = 1,
		sensitivity = 0,
	},
})

local main = "SUPER"

-- App launch
bind(main .. " + Return", 		hl.dsp.exec_cmd("kitty"))
bind(main .. " + D", 			hl.dsp.exec_cmd("rofi -show drun -theme $HOME/.dotfiles/Gruvbox/.config/rofi/config.rasi"))
bind(main .. " + B", 			hl.dsp.exec_cmd("zen-browser"))
bind(main .. " + e", 			hl.dsp.exec_cmd("thunar"))
bind(main .. " + S", 			hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
bind(main .. " + SHIFT + S", 	hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
bind(main .. " + T", 			hl.dsp.exec_cmd("tidal-hifi --no-sandbox"))

-- Workspaces
for i = 1, 6 do
	local key = i % 10
	bind(main .. " + " .. key,        	hl.dsp.focus({ workspace = i})) -- Switch to workspace 'n'
	bind(main .. " + SHIFT + " .. key,	hl.dsp.window.move({ workspace = i })) -- Move window to workspace 'n'
end

-- Window control
bind(main .. " + H", hl.dsp.focus({ direction = "left" }))
bind(main .. " + L", hl.dsp.focus({ direction = "right" }))
bind(main .. " + J", hl.dsp.focus({ direction = "up" }))
bind(main .. " + K", hl.dsp.focus({ direction = "down" }))

bind(main .. " + G", hl.dsp.window.float())
bind(main .. " + Q", hl.dsp.window.kill())
bind(main .. " + F", hl.dsp.window.fullscreen())
bind(main .. " + P", hl.dsp.window.pseudo())

bind(main .. " + Z", hl.dsp.layout("togglesplit"))
bind(main .. " + H", hl.dsp.layout("preselect left"))
bind(main .. " + K", hl.dsp.layout("preselect up"))
bind(main .. " + J", hl.dsp.layout("preselect down"))
bind(main .. " + L", hl.dsp.layout("preselect right"))

bind(main .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
bind(main .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- extra
bind(main .. " + ALT + Q", 	hl.dsp.exit())
bind(main .. " + A", 		hl.dsp.exec_cmd("playerctl play-pause"))

bind(main .. " + X", function()
	local gaps = 0
	if (hl.get_config("general.gaps_out").top == 10) then
		gaps = 35
	elseif (hl.get_config("general.gaps_out").top == 35) then
		gaps = 10
	end

	hl.config({
		general = {
			gaps_out = gaps
		}
	})
end)
