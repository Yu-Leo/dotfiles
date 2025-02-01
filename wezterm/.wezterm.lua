local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "YuGruvbox"

config.color_schemes = {
	["YuGruvbox"] = {
		foreground = "#d5c4a1",
		background = "#282828",

		cursor_bg = "#d5c4a1",
		cursor_fg = "#282828",
		cursor_border = "#d5c4a1",

		selection_fg = "#282828",
		selection_bg = "#d5c4a1",

		scrollbar_thumb = "#423e3c",

		split = "#484442",

		ansi = {
			"#232323",
			"#fb4934",
			"#b8bb26",
			"#fabd2f",
			"#83a598",
			"#d3869b",
			"#8ec07c",
			"#d5c4a1",
		},
		brights = {
			"#484442",
			"#fb4934",
			"#b8bb26",
			"#fabd2f",
			"#83a598",
			"#d3869b",
			"#8ec07c",
			"#fbf1c7",
		},
	},
}
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
config.font_size = 16.0
config.harfbuzz_features = { "calt=0" } -- turn off ligatures

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.enable_scroll_bar = false

config.window_frame = {
	font = wezterm.font({ family = "FiraCode", weight = "Bold" }),
	font_size = 16.0,
	active_titlebar_bg = "#333333",
	inactive_titlebar_bg = "#333333",
}

config.keys = {
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

wezterm.on("update-right-status", function(window, _)
	local date = wezterm.strftime("%Y-%m-%d %H:%M")

	window:set_right_status(wezterm.format({
		{ Text = date },
	}))
end)

return config
