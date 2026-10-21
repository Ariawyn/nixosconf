{...}: {
  flake.nixosModules.users = {...}: {
    users.users.aria = {
      isNormalUser = true;
      description = "Aria Jonsdottir";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
    
    security.sudo.extraRules = [{
      users = [ "aria" ];
      commands = [{
        command = "ALL";
        options = [ "NOPASSWD" ];
      }];
    }];
  };
}
