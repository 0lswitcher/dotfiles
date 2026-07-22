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

require("smart-scrolling-layout-gaps") -- import script for dynamically changing `focus_fit_method` for scrolling layout

-- ░█▄█░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀▄░█▀▀░░░░
-- ░█░█░█░█░█░█░░█░░░█░░█░█░█▀▄░▀▀█░░▀░
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀▀▀░░▀░

-- monitor format:    name,           resolution,         position,              scale

hl.monitor({ output = "DP-2",     mode = "1920x1080", position = "0x0",        scale = 1 }) -- left monitor
hl.monitor({ output = "DP-1",     mode = "1920x1080", position = "1920x0",     scale = 1 }) -- middle monitor
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "3840x0",     scale = 1 }) -- right monitor
hl.monitor({ output = "",         mode = "preferred", position = "auto",       scale = 1 }) -- fallback config

hl.workspace_rule({ workspace = "1", monitor = "DP-2", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", persistent = true, default = false })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", persistent = true, default = false })
hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true, default = false })
hl.workspace_rule({ workspace = "6", monitor = "DP-1", persistent = true, default = false })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true, default = false })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", persistent = true, default = false })

-- set 1st workspace on each monitor to scrolling layout (the rest are set to dwindle)
hl.workspace_rule({ workspace = "1", layout = "scrolling" })
hl.workspace_rule({ workspace = "4", layout = "scrolling" })
hl.workspace_rule({ workspace = "7", layout = "scrolling" })

-- define unique direction for scrolling layout on each monitor (i don't do this anymore, but it's left here for our convenience)
--hl.workspace_rule({ workspace = "1", layout_opts = { direction = "left" } })
--hl.workspace_rule({ workspace = "4", layout_opts = { direction = "up" } })
--hl.workspace_rule({ workspace = "7", layout_opts = { direction = "right" } })

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
local zed = "zeditor -n ~/777"
local screenshotRegion = "hyprshot -m region -o ~/stuff/pictures/screenshots"
local screenshotWindow = "hyprshot -m window -m active -o ~/stuff/pictures/screenshots"
local screenshotScreen = "hyprshot -m output -o ~/stuff/pictures/screenshots"
local neonav =
	"foot bash -i -l -c 'source /home/y2k/.bashrc; /home/y2k/stuff/dev/rust/neonav/neonav-v0.0.5/target/release/neonav'"
local wallpaperPicker = "foot -T WallpaperPicker bash /home/y2k/stuff/dev/bash/scripts/background-picker.sh && wal -R"
local themePicker = "foot -T ThemePicker bash ~/stuff/dev/bash/scripts/theme-picker.sh & wal -R"

-- ░█▀█░█░█░▀█▀░█▀█░░░░░░░░░█▀▀░▀█▀░█▀█░█▀▄░▀█▀░░░░
-- ░█▀█░█░█░░█░░█░█░░░▄▄▄░░░▀▀█░░█░░█▀█░█▀▄░░█░░░▀░
-- ░▀░▀░▀▀▀░░▀░░▀▀▀░░░░░░░░░▀▀▀░░▀░░▀░▀░▀░▀░░▀░░░▀░

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	hl.exec_cmd("hyprctl setcursor Capitaine Cursors 30") ------------ set cursor (doesn't effect gtk apps)
  --hl.exec_cmd("hyprctl setcursor WinSur White Cursors 36 &) -------- set cursor (doesn't effect gtk apps)
	hl.exec_cmd("awww-daemon") --------------------------------------- initialize wallpaper daemon
	hl.exec_cmd("nm-applet --indicator") ----------------------------- initialize network manager applet
	hl.exec_cmd("swaync") -------------------------------------------- initialize notification daemon
	hl.exec_cmd("systemctl --user start hyprpolkitagent") ------------ initialize authentication daemon
  --hl.exec_cmd("bash $shPath/workspace-previews-wrapper.sh" &) ------ initialize workspace previews scripts
	hl.exec_cmd("waybar") -------------------------------------------- initialize status bar
	hl.exec_cmd("~/stuff/dev/git/0l-dev-env/pomoc/build/bin/pomod") -- initialize pomodoro timer daemon
	hl.exec_cmd("hyprsunset") ---------------------------------------- initialize hyprsunset for blue-light filter
  --hl.exec_cmd("terminal -T SysInfo --hold -e $fastfetch" &) -------- open terminal (foot fastfetch)
  --hl.exec_cmd("hyprctl plugin load /run/current-system/sw/lib/libhyprfocus.so") -- broken upstream: https://github.com/hyprwm/hyprland-plugins/issues/681
end)

-- ░█░░░█▀█░█▀█░█░█░░░█▀█░█▀█░█▀▄░░░█▀▀░█▀▀░█▀▀░█░░░░░░
-- ░█░░░█░█░█░█░█▀▄░░░█▀█░█░█░█░█░░░█▀▀░█▀▀░█▀▀░█░░░░▀░
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀▀░░░░▀░░░▀▀▀░▀▀▀░▀▀▀░░▀░

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 7, -- fix css_gaps syntax
		--7, --top
		--20, --left
		--10, --bottom
		--20, --right

		border_size = 2,

		col = {
			--active_border = { colors = { "rgba(e8154dee)", "rgba(d96f0dee)" }, angle = 45 }, -- warm
			--active_border = { colors = { "rgba(e8154dee)", "rgba(f73bb2ee)" }, angle = 45 }, -- warm n pink
			--active_border = { colors = { "rgba(00000000)", "rgba(f5f5f580)" }, angle = 45 }, -- single soft white
			--active_border = { colors = { "rgba(f73bb2ee)", "rgba(3bacf7ee)" }, angle = 45 }, -- cotton candy
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },   -- lime
			--active_border = "rgba(00000000)", -- invisible
			inactive_border = "rgba(00000000)", -- invisible
			--inactive_border = "rgba(595959aa)",
		},

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https=//wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle", -- applied to all workspaces but 1, 4, and 7 (the 1st workspace on each monitor) - see workspace rules below
	},

	dwindle = {
		preserve_split = true,
		smart_split = false,
		precise_mouse_move = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
	    fullscreen_on_one_column = true,
        column_width = 0.95,
        focus_fit_method = 0,
        direction = "up",
	},

	decoration = {
		rounding = 10,

		active_opacity = 0.8,
		inactive_opacity = 0.6,

		dim_special = 0.4,

		shadow = {
			enabled = true,
			range = 14,
			render_power = 3,
			color = "rgba(00000045)",
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

--hl.animation({ leaf = "hyprfocusIn", enabled = true, speed = 1, bezier = "linear" })
--hl.animation({ leaf = "hyprfocusOut", enabled = true, speed = 1, bezier = "linear"})

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

-- program binds: -------------------------------------------------------------------------------

-- general
hl.bind(mainMod .. " +     A", hl.dsp.exec_cmd(terminal)) ----------- foot -------- terminal
hl.bind(mainMod .. " +     E", hl.dsp.exec_cmd(fileManager)) -------- pcmanfm-qt -- file manager (GUI)
hl.bind(mainMod .. " +     R", hl.dsp.exec_cmd(ranger)) ------------- ranger ------ file manager (TUI)
hl.bind(mainMod .. " +     B", hl.dsp.exec_cmd(browser)) ------------ firefox ----- browser
hl.bind(mainMod .. " +     W", hl.dsp.exec_cmd(browser)) ------------ firefox ----- browser
hl.bind(mainMod .. " +     P", hl.dsp.exec_cmd(ffp)) ---------------- firefox ----- browser (private)
--hl.bind(mainMod .. " + M + S", hl.dsp.exec_cmd(spotify)) ------------ spotify ----- music player (commented out due to conflict w/ bottom waybar and window splitting)
hl.bind(mainMod .. " +     N", hl.dsp.exec_cmd(neonav)) ------------- neonav ------ custom project
hl.bind(mainMod .. " +     L", hl.dsp.exec_cmd("neovide")) ---------- neovide ----- text editor (GUI - *for neovim)
hl.bind(mainMod .. " +     V", hl.dsp.exec_cmd("codium")) ----------- vscodium ---- FOSS telemetry-free vscode fork/alt
hl.bind(mainMod .. " +     Z", hl.dsp.exec_cmd(zed)) ---------------- zed editor -- speedy text editor written in rust (GUI)
--hl.bind(SHIFT .. " + Home", hl.dsp.exec_cmd(wallpaperPicker))
--hl.bind(SHIFT .. " + End",  hl.dsp.exec_cmd(themePicker))

-- system monitor (a.k.a. task manager)
hl.bind(mainMod .. " + CTRL + DELETE ", hl.dsp.exec_cmd(btop))

-- kando (pie-menu everything* launcher)
--hl.bind("CTRL + space", hl.dsp.global("menu.kando.Kando:sao"))
hl.bind("CTRL + space", hl.dsp.exec_cmd("bash /home/y2k/stuff/dev/bash/scripts/kando-wrapper.sh"))

-- ulauncher (traditional application launcher)
hl.bind(mainMod .. " +  Q", hl.dsp.exec_cmd(launcher))

-- window & layout management binds: ------------------------------------------------------------

-- modify window properties
hl.bind(mainMod .. " +     space", hl.dsp.window.float({ action = "toggle" })) -------------- float window
hl.bind(mainMod .. " +     space", hl.dsp.window.center()) --------------------------------- center window
hl.bind(mainMod .. " +         S", hl.dsp.layout("togglesplit")) ---------------------------- split window
hl.bind(mainMod .. " +         F", hl.dsp.window.fullscreen({ action = "toggle" })) ---- fullscreen window
hl.bind(mainMod .. " +         C", hl.dsp.window.close()) ----------------------------------- close window
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.float({ action = "toggle" })) -------- pseudo tile window

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

-- resize windows (ctrl + shift + arrow keys)
local function resize(x, y)
	return function()
		hl.dispatch(hl.dsp.window.resize({ x = x, y = y, relative = true }))
	end
end
hl.bind("CTRL + SHIFT + left", resize(-25, 0), { repeating = true })
hl.bind("CTRL + SHIFT + right", resize(25, 0), { repeating = true })
hl.bind("CTRL + SHIFT + up", resize(0, -25), { repeating = true })
hl.bind("CTRL + SHIFT + down", resize(0, 25), { repeating = true })

-- alt tab pretty much (cycles through windows and brings them to top)
hl.bind(mainMod .. " +  Tab", hl.dsp.window.cycle_next({}))
hl.bind(mainMod .. " +  Tab", hl.dsp.window.alter_zorder({ mode = "top" }))

-- workspace-related binds: -------------------------------------------------------------------

-- change/switch workspaces (mainMod + [0-9])
-- move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	local key = i
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- change/switch workspaces (mainMod + arrow keys)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.focus({ workspace = "e+1" }))

-- change/switch workspaces and bring windows (mainMod + shift + arrow keys)
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ workspace = "e+1", follow = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ workspace = "e-1", follow = true }))

-- special workspace toggle
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("minimize"))
-- send to special workspace
hl.bind(
	mainMod .. " + SHIFT + X",
	hl.dsp.window.move({
		workspace = "special:minimize",
	})
)

-- mouse-centric/based binds: ----------------------------------------------------------------

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

-- other misc. binds: ----------------------------------------------------------------------

-- toggle waybar visibility
hl.bind(mainMod .. " + SHIFT +  W", hl.dsp.exec_cmd("killall -SIGUSR1 .waybar-wrapped")) -- top bar
hl.bind(mainMod .. " +  M", hl.dsp.exec_cmd("killall -SIGUSR2 .waybar-wrapped")) -- bottom bar

-- show and hide desktop shortcuts (great for letting non-linux users access ya shiz)
hl.bind(mainMod .. " +  D", hl.dsp.exec_cmd("pcmanfm-qt --desktop"))
hl.bind(mainMod .. " +  H", hl.dsp.exec_cmd("pcmanfm-qt --desktop-off"))

-- screenshot
hl.bind(mainMod .. " + SHIFT + S ", hl.dsp.exec_cmd(screenshotRegion))
hl.bind("ALT + SHIFT + S ", hl.dsp.exec_cmd(screenshotWindow))
hl.bind("CTRL + SHIFT + S ", hl.dsp.exec_cmd(screenshotScreen))

-- activate blue light filter (w/ hyprsunset)
hl.bind(mainMod .. " + SHIFT + semicolon ", hl.dsp.exec_cmd("hyprctl hyprsunset temperature 2500")) -- activate
hl.bind(mainMod .. " + semicolon ", hl.dsp.exec_cmd("hyprctl hyprsunset identity")) -- de-activate/restore to default

-- disable most keybinds for gaming / game mode
--
-- note: most binds were set with intention of avoiding any conflict while gaming, with the exception of kando.
--       feel free to disable this bind, just make sure to find a non-conflicting bind for kando, since it *will*
--       activate any time you try to crouch jump in a game.
--
--       the ability to close anything w/ mainMod + C bind is still kept in emergencies
--
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("notify-send 'Entered Game Mode...All binds disabled!' 'Press mainMod + Escape/ESC to re-enable binds'"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(xpSoundShort))
hl.bind(mainMod .. " + G ", hl.dsp.submap("clean"))
hl.define_submap("clean", function()
    hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- close window
    hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("notify-send 'Exiting Game Mode...All binds re-enabled!'"))
    hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(xpSoundShort))
    hl.bind(mainMod .. " + Escape", hl.dsp.submap("reset")) -- exit submap / re-enable binds
end)

-- exit hyprland (left in-case u need it)
--  hl.bind(mainMod .. " +  M, exit,

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
	no_blur = true,
	no_shadow = true,
	border_size = 0,
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

-- remove border from beamng
hl.window_rule({
	name = "beamng",
	match = {
		class = "^(steam_app_0)$",
	},
	border_size = 0,
})

-- remove border from inactive windows (not using cus the window contents jump around too much - made em invisible instead)
--hl.window_rule({
--	match = { focus = 0 },
--	border_size = 0,
--})

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

-- ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀░░░░
-- ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█░░▀░
-- ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░

--hl.config({
--    plugin = {
--        hyprfocus = {
--            enabled = true,
--            animate_floating = true,
--            animate_workspacechange = false,
--
--            keyboard_focus_animation = shrink,
--            mouse_focus_animation = shrink,
--
--            fade_opacity = 0.7,
--            shrink_percentage = 0.75,
--        }
--    }
--})
