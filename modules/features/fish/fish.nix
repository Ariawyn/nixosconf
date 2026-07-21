{ self, inputs, ... }: {
    perSystem = { pkgs, lib, config, ... }: {
	packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
	    inherit pkgs;
	    configFile.content = ''
		set fish_greeting
		fish_vi_key_bindings

		${lib.getExe pkgs.starship} init fish | source
	    '';
	    shellAliases = 
	    let
		flakePath = "~/Nix/";
	    in {
		rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
	    }; 
        };
    };
}

