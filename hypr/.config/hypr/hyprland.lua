--  ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗      ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
--  ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
--  ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
--  ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
--  ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
--  ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝

-- welcome to my hyprland configuration, one thing you'll notice is that everything is kept within one file.
-- many people choose to seperate their configuration into multiple files and that's completely viable,
-- but out of my personal preference when working within IDE's and for ease of accessibility for beginners,
-- everything is held here. enjoy!

-- ░█▄█░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀▄░█▀▀░░░░
-- ░█░█░█░█░█░█░░█░░░█░░█░█░█▀▄░▀▀█░░▀░
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀▀▀░░▀░

-- monitor format:    name,              resolution,             position,       scale

hl.monitor({ output = "DP-2", mode = "1920x1080", position = "0x0", scale = 1 }) -- left monitor
hl.monitor({ output = "DP-1", mode = "1920x1080", position = "1920x0", scale = 1 }) -- middle monitor
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "auto-right", scale = 1 }) -- right monitor

hl.workspace_rule({ workspace = "1", monitor = "DP-2", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", persistent = true, default = false })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", persistent = true, default = false })
hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true, default = false })
hl.workspace_rule({ workspace = "6", monitor = "DP-1", persistent = true, default = false })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true, default = false })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", persistent = true, default = false })

-- ░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀█░█▀█░█▀█░█▀▀░█▀█░▀█▀░░░█░█░█▀█░█▀▄░▀█▀░█▀█░█▀▄░█░░░█▀▀░█▀▀
-- ░█▀▀░█░█░▀▄▀░░█░░█▀▄░█░█░█░█░█░█░█▀▀░█░█░░█░░░░▀▄▀░█▀█░█▀▄░░█░░█▀█░█▀▄░█░░░█▀▀░▀▀█
-- ░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░░░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀▀▀░▀▀▀

-- NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force Electron apps (like Kando) to run under Wayland instead of XWayland (,x11 kando)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Set standard XDG Base Directories
hl.env("XDG_CONFIG_HOME", os.getenv("HOME") .. "/.config")
hl.env("XDG_CACHE_HOME", os.getenv("HOME") .. "/.cache")
hl.env("XDG_DATA_HOME", os.getenv("HOME") .. "/.local/share")
hl.env("XDG_STATE_HOME", os.getenv("HOME") .. "/.local/state")

-- ░█▄█░█░█░░░█▀█░█▀▄░█▀█░█▀▀░█▀▄░█▀█░█▄█░█▀▀░░░░
-- ░█░█░░█░░░░█▀▀░█▀▄░█░█░█░█░█▀▄░█▀█░█░█░▀▀█░░▀░
-- ░▀░▀░░▀░░░░▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀░▀░▀▀▀░░▀░

local shPath = "/home/y2k/stuff/dev/bash/scripts"
local terminal = "foot"
local fileManager = "pcmanfm-qt /home/y2k/stuff"
local ranger = "wal -R & foot ranger /home/y2k/777"
local fastfetch = "fastfetch"
local browser = "firefox"
local ffp = "firefox --private-window"
local launcher = "ulauncher"
local spotify = "com.spotify.Client"
local btop = "foot bash -l -c 'wal -R && btop'"
local screenshot = "hyprshot -m region -o ~/stuff/pictures/screenshots "
local neonav =
	"foot bash -i -l -c 'source /home/y2k/.bashrc; /home/y2k/stuff/dev/rust/neonav/neonav-v0.0.5/target/release/neonav'"
local wallpaperPicker = "foot -T WallpaperPicker bash /home/y2k/stuff/dev/bash/scripts/background-picker.sh && wal -R"
local themePicker = "foot -T ThemePicker bash ~/stuff/dev/bash/scripts/theme-picker.sh & wal -R"

-- ░█▀█░█░█░▀█▀░█▀█░░░░░░░░░█▀▀░▀█▀░█▀█░█▀▄░▀█▀░░░░
-- ░█▀█░█░█░░█░░█░█░░░▄▄▄░░░▀▀█░░█░░█▀█░█▀▄░░█░░░▀░
-- ░▀░▀░▀▀▀░░▀░░▀▀▀░░░░░░░░░▀▀▀░░▀░░▀░▀░▀░▀░░▀░░░▀░

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	hl.exec_cmd("hyprctl setcursor Capitaine Cursors 30") ----------# set cursor (doesn't effect gtk apps)
	--hl.exec_cmd("hyprctl setcursor WinSur White Cursors 36 &) ------# set cursor (doesn't effect gtk apps)
	hl.exec_cmd("awww-daemon") -------------------------------------# initialize wallpaper daemon
	hl.exec_cmd("nm-applet --indicator") ---------------------------# initialize network manager applet
	hl.exec_cmd("swaync") ------------------------------------------# initialize notification daemon
	hl.exec_cmd("systemctl --user start hyprpolkitagent") ----------# initialize authentication daemon
	--hl.exec_cmd(terminal -T SysInfo --hold -e $fastfetch &) --------# open terminal (foot fastfetch)
	--hl.exec_cmd("bash $shPath/workspace-previews-wrapper.sh &) -----# initialize workspace previews scripts
	hl.exec_cmd("waybar") ---------------# initialize status bar
	--hl.exec_cmd("sleep 15 && systemd-run --user --scope kando") ----------------# initialize pie app picker
	-- ^^ this any many variations don't work, so I'm launching w/ ~/.config/autostart/kando.desktop
end)

-- ░█░░░█▀█░█▀█░█░█░░░█▀█░█▀█░█▀▄░░░█▀▀░█▀▀░█▀▀░█░░░░░░
-- ░█░░░█░█░█░█░█▀▄░░░█▀█░█░█░█░█░░░█▀▀░█▀▀░█▀▀░█░░░░▀░
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀▀░░░░▀░░░▀▀▀░▀▀▀░▀▀▀░░▀░

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 7, --top
		20, --left
		10, --bottom
		20, --right

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https=//wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,

		active_opacity = 0.8,
		inactive_opacity = 0.6,

		dim_special = 0.4,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0x1a1a1aee,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 2,
			ignore_opacity = true,
			vibrancy = 0.1696,
		},
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},

	cursor = {
		no_hardware_cursors = true,
	},

	-- -----------------------------------------------------
	-- ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
	-- █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█
	-- -----------------------------------------------------
	-- source: https=//github.com/xaicat/LimeFrenzy/
	-- repo hasn't been updated in over a year, i updated for hyprland 0.55 .lua migration
	-- -----------------------------------------------------

	animations = {
		enabled = true,
	},
})

hl.curve("default", { type = "bezier", points = { { 0.12, 0.92 }, { 0.08, 1.0 } } })
hl.curve("wind", { type = "bezier", points = { { 0.12, 0.92 }, { 0.08, 1.0 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.18, 0.95 }, { 0.22, 1.03 } } })
hl.curve("linear", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "wind", style = "popin 60%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "overshot", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "overshot", style = "popin 60%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "default", style = "popin" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "overshot", style = "slide" })
hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 5,
	bezier = "overshot",
	style = "slidefadevert 100%",
})
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "linear" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 24, bezier = "linear", style = "loop" })

-- older animations backup

--animations {
--    enabled = true
--
--    bezier = easeOutQuint,0.23,1,0.32,1
--    bezier = easeInOutCubic,0.65,0.05,0.36,1
--    bezier = linear,0,0,1,1
--    bezier = almostLinear,0.5,0.5,0.75,1.0
--    bezier = quick,0.15,0,0.1,1
--    bezier = easeInOutQuint, 0.76, 0, 0.24, 1
--    bezier = easeOutCirc, 0, 0.55, 0.46, 1
--    bezier = overshoot, 0.05, 0.9, 0.1, 1.1
--    animation = global, 1, 10, default
--    animation = border, 1, 5.39, easeOutQuint
--    animation = fadeIn, 1, 1.73, almostLinear
--    animation = fadeOut, 1, 1.46, almostLinear
--    animation = fade, 1, 3.03, quick
--    animation = layers, 1, 3.81, easeOutQuint
--    animation = layersIn, 1, 4, easeOutQuint, fade
--    animation = layersOut, 1, 1.5, linear, fade
--    animation = fadeLayersIn, 1, 1.79, almostLinear
--    animation = fadeLayersOut, 1, 1.39, almostLinear
--    animation = windows, 1, 6, easeOutCirc, gnomed
--    animation = windowsMove, 1, 6, overshoot, slide
--    animation = workspaces, 1, 8, easeInOutQuint
--}

hl.config({
	dwindle = {
		preserve_split = true, -- you probably want this
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

-- ░▀█▀░█▀█░█▀█░█░█░▀█▀░░░░
-- ░░█░░█░█░█▀▀░█░█░░█░░░▀░
-- ░▀▀▀░▀░▀░▀░░░▀▀▀░░▀░░░▀░

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "", --pc104
		kb_options = "caps:super, altwin:swap_alt_win",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},
})

-- ░█░█░█▀▀░█░█░█▀▄░▀█▀░█▀█░█▀▄░█▀▀░░░░
-- ░█▀▄░█▀▀░░█░░█▀▄░░█░░█░█░█░█░▀▀█░░▀░
-- ░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░░▀░

local mainMod = "SUPER" -- set wink as main modifier (which has been swapped to alt and caps)

-- programs
hl.bind(mainMod .. " +  A", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " +  E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " +  R", hl.dsp.exec_cmd(ranger))
hl.bind(mainMod .. " +  B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " +  W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " +  P", hl.dsp.exec_cmd(ffp))
--hl.bind(mainMod .. " +  S", hl.dsp.exec_cmd(spotify))
hl.bind(mainMod .. " +  N", hl.dsp.exec_cmd(neonav))
hl.bind(mainMod .. " +  L", hl.dsp.exec_cmd("neovide"))
hl.bind(mainMod .. " +  V", hl.dsp.exec_cmd("codium"))
--hl.bind(SHIFT .. " + Home", hl.dsp.exec_cmd(wallpaperPicker))
--hl.bind(SHIFT .. " + End",  hl.dsp.exec_cmd(themePicker))

--hl.bind(mainMod .. " +  K", hl.dsp.exec_cmd("bash -l -c 'sleep 7s && kando'"))

-- window management
hl.bind(mainMod .. " +  space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " +  space", hl.dsp.window.center())
hl.bind(mainMod .. " +    S", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " +    F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " +    C", hl.dsp.window.close())

-- special workspace toggle
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("minimize"))
-- send to special workspace
hl.bind(
	mainMod .. " + SHIFT + X",
	hl.dsp.window.move({
		workspace = "special:minimize",
	})
)

-- screenshot
hl.bind(mainMod .. " + SHIFT + S ", hl.dsp.exec_cmd(screenshot))

-- btop
hl.bind(mainMod .. " + CTRL + DELETE ", hl.dsp.exec_cmd(btop))

-- kando
--hl.bind("CTRL + space", hl.dsp.global("menu.kando.Kando:sao"))
hl.bind("CTRL + space", hl.dsp.exec_cmd("bash /home/y2k/stuff/dev/bash/scripts/kando-wrapper.sh"))

-- ulauncher
hl.bind(mainMod .. " +  Q", hl.dsp.exec_cmd(launcher))

-- toggle hide top waybar
hl.bind(mainMod .. " +  Z", hl.dsp.exec_cmd("killall -SIGUSR1 .waybar-wrapped"))

-- toggle hide bottom waybar
hl.bind(mainMod .. " +  M", hl.dsp.exec_cmd("killall -SIGUSR2 .waybar-wrapped"))

-- show and hide desktop shortcuts (wallpaper sync. needs updating)
hl.bind(mainMod .. " +  D", hl.dsp.exec_cmd("pcmanfm-qt --desktop"))
hl.bind(mainMod .. " +  H", hl.dsp.exec_cmd("pcmanfm-qt --desktop-off"))

-- exit hyprland (commented out for now)
--  hl.bind(mainMod .. " +  M, exit,

-- move window focus (mainMod + arrow keys)
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- move windows (winkey *ignore alt symbol* + arrow keys)
hl.bind("ALT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("ALT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("ALT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("ALT + down", hl.dsp.window.move({ direction = "down" }))

-- switch workspaces (mainMod + [0-9])
-- move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	local key = i
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- change workspaces (mainMod + arrow keys)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.focus({ workspace = "e+1" }))

-- change workspaces and bring windows (mainMod + shift + arrow keys)
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ workspace = "e+1", follow = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ workspace = "e-1", follow = true }))

-- alt tab pretty much (cycles through windows and brings them to top)
hl.bind(mainMod .. " +  Tab", hl.dsp.window.cycle_next({}))
hl.bind(mainMod .. " +  Tab", hl.dsp.window.alter_zorder({ mode = "top" }))

-- move/resize windows (mainMod + LMB/RMB and dragging)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- side buttons
--hl.bind(mainMod .. " + mouse:276", hl.dsp.window.drag(),   { mouse = true })
--hl.bind(mainMod .. " + mouse:275", hl.dsp.window.resize(), { mouse = true })

-- change window opacity w mouse wheel ( mouse_up and mouse_down are inverted ¯\_(:/)_/¯ )
-- fully opaque at all times
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.tag({ tag = "-alpha_higher" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.tag({ tag = "+alpha_highest" }))
-- less transparent, still dynamic
hl.bind(mainMod .. " + mouse_down", hl.dsp.window.tag({ tag = "-alpha_default" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.window.tag({ tag = "+alpha_higher" }))
-- default
hl.bind(mainMod .. " + mouse_up", hl.dsp.window.tag({ tag = "-alpha_higher" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.window.tag({ tag = "-alpha_highest" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.window.tag({ tag = "+alpha_default" }))
-- rules kept here for simplicity, all other rules are kept at bottom of this file
hl.window_rule({ match = { tag = "alpha_default" }, opacity = "0.8 override 0.6 override" })
hl.window_rule({ match = { tag = "alpha_higher" }, opacity = "0.9 override 0.8 override" })
hl.window_rule({ match = { tag = "alpha_highest" }, opacity = "1 override" })

-- ░█▀▄░█░█░█░░░█▀▀░█▀▀░░░░
-- ░█▀▄░█░█░█░░░█▀▀░▀▀█░░▀░
-- ░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░

-- See https=//wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https=//wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

-- to see active programs and identify class or title, use 'hyprctl clients'

hl.window_rule({
	name = "kando",
	match = {
		class = "menu.kando.Kando",
		title = "Kando Menu",
	},
	no_blur = true,
	opaque = true,
	move = { 0, 0 },
	rounding = 0,
	size = { "100%", "100%" },
	border_size = 0,
	no_anim = true,
	float = true,
	pin = true,
})

hl.window_rule({
	name = "ulauncher",
	match = {
		class = "^(ulauncher)$",
	},
	stay_focused = true,
})

hl.window_rule({
	name = "waypaper",
	match = {
		class = "^(waypaper)$",
	},
	float = true,
})

--hl.window_rule({
--  name  = "obsidian",
--  match = {
--    class = "^(obsidian)$",
--  },
--  keepaspectratio,
--})

hl.window_rule({
	name = "feh",
	match = {
		class = "^(feh)$",
	},
	float = true,
	keep_aspect_ratio = true,
	center = true,
	opaque = true,
})

-- spotify on the left monitor
hl.window_rule({
	name = "spotify",
	match = {
		class = "^(Spotify)$",
	},
	monitor = "DP-2",
})

-- youtube pop-out
hl.window_rule({
	name = "youtube-pop-out",
	match = {
		title = "^(Picture-in-Picture)$",
	},
	float = true,
})

-- steam friends list
hl.window_rule({
	name = "steam-friends-list",
	match = {
		title = "^(Friends List)$",
	},
	float = true,
})

-- pavucontrol
hl.window_rule({
	name = "pavucontrol",
	match = {
		class = "^(org.pulseaudio.pavucontrol)$",
	},
	float = true,
	move = { 575, 50 },
	size = { 1000, 800 },
})

-- custom windows
hl.window_rule({
	name = "welcome-window",
	match = {
		title = "^(Welcome)$  ",
	},
	float = true,
	move = { 1700, 125 },
	size = { 755, 395 },
})

hl.window_rule({
	name = "files-window",
	match = {
		title = "^(Files)$",
	},
	float = true,
	move = { 1700, 535 },
	size = { 755, 280 },
})

hl.window_rule({
	name = "sys-info-window",
	match = {
		title = "^(SysInfo)$ ",
	},
	float = true,
	move = { 2490, 125 },
	size = { 616, 690 },
})

hl.window_rule({
	name = "color-picker-window",
	match = {
		title = "^(ColorPicker)$    ",
	},
	float = true,
	move = { 25, 45 },
	size = { 70, 45 },
})

hl.window_rule({
	name = "wallpaper-picker-window",
	match = {
		title = "^(WallpaperPicker)$",
	},
	float = true,
	move = { 25, 300 },
	size = { 350, 500 },
	stay_focused = true,
})

hl.window_rule({
	name = "colorscheme-picker-window",
	match = {
		title = "^(ColorschemePicker)$",
	},
	float = true,
	move = { 275, 300 },
	size = { 350, 500 },
	stay_focused = true,
})

-- remove = { border from beamng
hl.window_rule({
	name = "beamng",
	match = {
		class = "^(steam_app_0)$",
	},
	border_size = 0,
})

-- fix some dragging issues with XWayland
hl.window_rule({
	name = "xwayland-fix",
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

-- blur fix for swaync
hl.layer_rule({
	name = "swaync blur fix",
	match = {
		namespace = "swaync-control-center|swaync-notification-window",
	},
	blur = true,
	ignore_alpha = 0.5,
})

-- hyprpicker fix
hl.layer_rule({
	name = "hyprpicker",
	match = {
		class = "selector",
	},
	no_anim = true,
})
