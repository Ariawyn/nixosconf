{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.nvim = moduleWithSystem ({self', ...}: {
    programs.neovim = {
      enable = true;
      package = self'.packages.neovim;
    };
  });
  perSystem = {pkgs, ...}: let
    pkgList = with pkgs; [
      # LSPs
      lua-language-server
      vscode-langservers-extracted
      rust-analyzer
      ast-grep
      prettier
      alejandra
      rustfmt
      stylua
      nixd
      csharp-ls
      csharpier
      gdtoolkit_4

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
