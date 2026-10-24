{...}: {
  flake.nixosModules.utils = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      fastfetch
      eza
      bat
      btop
    ];
  };
}
