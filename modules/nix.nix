{
  config,
  pkgs,
  inputs,
  inputs',
  lib,
  self,
  ...
}: {
  environment.systemPackages = [
    # we need git for flakes
    pkgs.git
    inputs'.nh.packages.default
  ];
  # environment.variables.FLAKE = "/home/linuxmobile/Dev/nixland";

  nix = {
    distributedBuilds = true;

    # auto garbage collect
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      substituters = [
        "https://nix-community.cachix.org"
        "https://fufexan.cachix.org"
        # "https://helix.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
        #"helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      ];

      trusted-users = ["root" "@wheel"];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (
        _: prev: {
          steam = prev.steam.override {
            extraPkgs = pkgs:
              with pkgs; [
                keyutils
                libkrb5
                libpng
                libpulseaudio
                libvorbis
                stdenv.cc.cc.lib
                xorg.libXcursor
                xorg.libXi
                xorg.libXinerama
                xorg.libXScrnSaver
              ];
            extraProfile = "export GDK_SCALE=1";
          };
        }
      )
    ];
  };
}