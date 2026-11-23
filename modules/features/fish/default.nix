{ self, inputs, config, ... }: {
	perSystem = { pkgs, lib, self', ... }: {
		packages.fish = inputs.wrapper-modules.wrappers.fish.wrap {
			inherit pkgs;
			configFile.content = ''
				set fish_greeting
				fish_vi_key_bindings

				${lib.getExe pkgs.starship} init fish | source
			'';

			shellAliases = let
				flakePath = "~/Nix/";
			in {
				ls = "${lib.getExe pkgs.lsd} -l";
				v = lib.getExe self'.packages.neovim;
				vim = lib.getExe self'.packages.neovim;
				cat = lib.getExe pkgs.bat;
				conf = "nvim ${flakePath}";
				rebuild = "cd ${flakePath} && sudo nixos-rebuild switch --flake .";
			}; 
        };
    };
}

