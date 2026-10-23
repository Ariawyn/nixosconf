{ self, inputs, ... }: {
    flake.nixosConfigurations.asteria = inputs.nixpkgs.lib.nixosSystem {
	modules = with self.nixosModules; [
            asteriaConfiguration
        ];
    };
}
