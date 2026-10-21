{ self, inputs, ... }: {
    flake.nixosConfigurations.melinoe = inputs.nixpkgs.lib.nixosSystem {
	modules = with self.nixosModules; [
            melinoeConfiguration
        ];
    };
}
