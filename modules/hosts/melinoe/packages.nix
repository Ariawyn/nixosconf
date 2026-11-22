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
	    wdisplays
	];

	services.jellyfin = {
	    enable = true;
	    openFirewall = true;
	};

	services.avahi = {
	    enable = true;
	    nssmdns4 = true;
	    openFirewall = true;
	    publish = {
	        enable = true;
		userServices = true;
	    };
	};

	networking.firewall = {
	    enable = true;
	    allowedTCPPorts = [ 8010 8096 ];
	    allowedUDPPortRanges = [
		{ from = 32768; to = 60999; }
	    ];
	};

	programs.firefox.enable = true;

	services.mullvad-vpn.package = pkgs.mullvad-vpn;
	services.mullvad-vpn.enable = true;

	services.power-profiles-daemon.enable = true;

	services.upower.enable = true;
    };
}
