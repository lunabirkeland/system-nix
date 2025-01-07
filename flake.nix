{
  description = "somewhat modular nixos config";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # probe-rs-rules to set recommended udev rules for probe-rs
    probe-rs-rules.url = "github:jneem/probe-rs-rules";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixos-hardware,
    lanzaboote,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      caudatus = let
        username = "luna";
        specialArgs = {inherit username inputs;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen4
            lanzaboote.nixosModules.lanzaboote
            ./hosts/caudatus

            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "home-manager.backup";

                extraSpecialArgs = specialArgs;
                users."${username}" = import ./home;
              };
            }
          ];
        };
    };
  };
}
