{ self, pkgs, inputs, ... }: {
    flake.nixosModules.melinoePackages = { config, pkgs, inputs, lib, ... }: {
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
	    # text editors
	    gedit

	    # file manager
	    thunar
	    thunar-volman
	    yazi

	    # media
	    vlc

	    # audio
	    pavucontrol

	    # downloads
	    qbittorrent

	    # dev stuff
	    godot

	    # social stuff
	    discord

	    # gaming
	    steam

	    # writing / productivity
	    obsidian
	];

	# Install specific packages as modules
	programs.firefox.enable = true;

	# VPN
	services.mullvad-vpn.package = pkgs.mullvad-vpn;
	services.mullvad-vpn.enable = true;

	# Enable services required for some packages
	services.power-profiles-daemon.enable = true;

	services.upower.enable = true;
    };
}
