{self, ...}: {
  flake.nixosModules.core = {pkgs, ...}: let
    modules = with self.nixosModules; [
      users
      locale
      bootloader
      networking
      nix
    ];
  in {
    imports = modules;

    environment.systemPackages = with pkgs; [
      vim
      unzip
      p7zip
      usbutils
      wget
      git
    ];

    services.gvfs.enable = true;

    system.stateVersion = "25.05"; 
  };
}
