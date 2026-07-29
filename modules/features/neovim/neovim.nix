{ self, inputs, moduleWithSystem, ... }: {
    flake.nixosModules.nvim = moduleWithSystem ({self', ...}: {
	programs.neovim = {
	    enable = true;
	    package = self'.packages.myNeovim;
	};
    });
    perSystem = { pkgs, lib, self', ... }: {
	packages.myNeovim = inputs.wrapper-modules.wrappers.neovim.wrap {
	    inherit pkgs;
	    
	};
    };
}
