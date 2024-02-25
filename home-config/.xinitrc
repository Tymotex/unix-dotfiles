exec i3

# Fix screen tearing.
nvidia-settings --assign CurrentMetaMode="\
	HDMI-0: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }, \
	DP-0: nvidia-auto-select +2560+0 { ForceFullCompositionPipeline = On }, \
	DP-4: nvidia-auto-select +6400+0 { ForceFullCompositionPipeline = On }"

