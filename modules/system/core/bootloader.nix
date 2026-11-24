{...}: {
  flake.nixosModules.bootloader = {...}: {
    boot = {
      loader = {
        timeout = 2;

        efi = {
          canTouchEfiVariables = true;
        };

        systemd-boot.enable = true;
      };
    };
  };
}
