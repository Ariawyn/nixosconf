{ self, pkgs, inputs, ... }: {
    flake.nixosModules.melinoePackages = { config, pkgs, inputs, lib, ... }: {
	environment.systemPackages = with pkgs; [
	    fastfetch	
	    gedit
	    thunar
	    thunar-volman
	    yazi
	    vlc
	    pavucontrol
	    qbittorrent
	    godot
	    discord
	    steam
	    obsidian
	];

	programs.firefox.enable = true;

	services.mullvad-vpn.package = pkgs.mullvad-vpn;
	services.mullvad-vpn.enable = true;

	services.power-profiles-daemon.enable = true;

	services.upower.enable = true;
    };
}
