{ self, pkgs, inputs, ... }: {
    flake.nixosModules.melinoeConfiguration = { config, pkgs, inputs, lib, ... }: {
        imports = [
            self.nixosModules.melinoeHardware
	    self.nixosModules.melinoePackages
            self.nixosModules.niri
        ];
        
        # Bootloader
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        # Networking
        networking.networkmanager.enable = true;
        networking.hostName = "melinoe";

        # Location
        time.timeZone = "Europe/London";
        i18n.defaultLocale = "en_GB.UTF-8";
        i18n.extraLocaleSettings = {
            LC_ADDRESS = "en_GB.UTF-8";
            LC_IDENTIFICATION = "en_GB.UTF-8";
            LC_MEASUREMENT = "en_GB.UTF-8";
            LC_MONETARY = "en_GB.UTF-8";
            LC_NAME = "en_GB.UTF-8";
            LC_PAPER = "en_GB.UTF-8";
            LC_TELEPHONE = "en_GB.UTF-8";
            LC_TIME = "en_GB.UTF-8";
        };

        # Configure console keymap
        console.keyMap = "uk";

        # Enable sound with pipewire
        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };

        # hardware and nvidia
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };

        services.xserver.enable = true;
        services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
        
        hardware.nvidia = {
            modesetting.enable = true;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;

            prime = {
                sync.enable = true;
                amdgpuBusId = "PCI:4:0:0";
                nvidiaBusId = "PCI:1:0:0";
            };
        };

        # display manager
        services.displayManager.autoLogin = {
            enable = true;
            user = "aria";
        };
        services.displayManager.sddm = {
            enable = true;
            wayland.enable = true;
        };


        # user stuff
        users.users.aria = {
            isNormalUser = true;
            description = "Aria Jonsdottir";
            extraGroups = [ "networkmanager" "wheel" ];
        };

        security.sudo.extraRules = [{
            users = [ "aria" ];
            commands = [{ 
                command = "ALL";
                options = [ "NOPASSWD" ];
            }];
        }];

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        system.stateVersion = "25.05";
    };
}
