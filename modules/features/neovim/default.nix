{ self, inputs, moduleWithSystem, ... }: {
    flake.nixosModules.nvim = moduleWithSystem ({self', ...}: {
	programs.neovim = {
	    enable = true;
	    package = self'.packages.neovim;
	};
    });
    perSystem = { pkgs, lib, self', ... }: let 
	    pkgList = with pkgs; [
			# LSPs


			# tools
			lua5_5
			tree-sitter
			ripgrep
			gcc
			cargo
			fzf
			gnumake
			luarocks
	    ];
	in {
	packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
	    inherit pkgs;
            env = {
                "CONFIG_ROOT" = ./.;
	    };
	    runtimePkgs = pkgList;
	    settings.config_directory = ./.;
	};
    };
}
