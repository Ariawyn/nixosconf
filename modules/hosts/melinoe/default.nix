{ self, inputs, ... }: {
    flake.nixosConfigurations.melinoe = inputs.nixpkgs.lib.nixosSystem {
	modules = [
            self.nixosModules.melinoeConfiguration
        ];
    };
}
