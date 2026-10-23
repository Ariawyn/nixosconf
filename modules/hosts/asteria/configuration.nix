{ self, pkgs, inputs, ... }: {
    flake.nixosModules.asteriaConfiguration = { config, pkgs, inputs, lib, ... }: {
        imports = with self.nixosModules; [
	    asteriaHardware
            core
        ];

        # Networking
        networking.hostName = "asteria";
    };
}
