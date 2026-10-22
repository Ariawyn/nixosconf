{ self, pkgs, inputs, ... }: {
    flake.nixosModules.melinoeConfiguration = { config, pkgs, inputs, lib, ... }: {
        imports = with self.nixosModules; [
            melinoeHardware
	    melinoePackages
            niri
	    nvim
            system
        ];

        # Networking
        networking.hostName = "melinoe";

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

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };
}
