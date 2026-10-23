{ self, pkgs, inputs, ... }: {
    flake.nixosModules.asteriaConfiguration = { config, pkgs, inputs, lib, ... }: {
        imports = with self.nixosModules; [
            core
        ];

	# Necessary as part of skipping hardware config
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

        # Networking
        networking.hostName = "asteria";
    };
}
