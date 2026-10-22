{...}: {
  flake.nixosModules.nix = {...}: {
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      optimise.automatic = true;

      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 5d";
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };
  };
}
