{ self, inputs, moduleWithSystem, ... }: {
    flake.nixosModules.kitty = moduleWithSystem ({self', ...}: {
	programs.kitty = {
	    enable = true;
	    package = self'.packages.myKitty;
	};
    });    
    perSystem = { pkgs, lib, self', ... }: {
	packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
	    inherit pkgs;

	    settings = {
		shell = "${lib.getExe self'.packages.myFish}";
		enable_audio_bell = false;

		font_size = 12;
		font_family = "JetBrainsMono Nerd Font";

		scrollbar = "never";
		window_padding_width = 9;

		cursor_trail = 1;
		cursor_trail_start_threshold = 1;

		confirm_os_window_close = 0;

		background_opacity = 0.75;
		hide_window_decorations = true;
	    };

	    keybindings = {
		"alt+1" = "goto_tab 1";
		"alt+2" = "goto_tab 2";
		"alt+3" = "goto_tab 3";
		"alt+4" = "goto_tab 4";
		"alt+5" = "goto_tab 5";
		"alt+6" = "goto_tab 6";
		"alt+7" = "goto_tab 7";
		"alt+8" = "goto_tab 8";
		"alt+9" = "goto_tab 9";
		"alt+q" = "close_tab";
		"alt+t" = "new_tab_with_cwd";
	    };
	};
    };
}

