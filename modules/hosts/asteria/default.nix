{ self, inputs, ... }: {
    # Asteria is the minimal vm testing host configuration
    flake.nixosConfigurations.asteria = inputs.nixpkgs.lib.nixosSystem {
	modules = with self.nixosModules; [
            asteriaConfiguration
        ];
    };
}
