{
  self,
  inputs,
  default,
  ...
}: let
  # system-agnostic args
  module_args._module.args = {inherit default inputs self;};
in {
  imports = [
    {
      _module.args = {
        # we need to pass this to HM
        inherit module_args;

        # NixOS modules
        sharedModules = [
          {home-manager.useGlobalPkgs = true;}
          inputs.agenix.nixosModules.default
          inputs.hm.nixosModule
          inputs.hyprland.nixosModules.default
          inputs.lanzaboote.nixosModules.lanzaboote
          module_args
          ./system.nix
          # ./network.nix
          ./nix.nix
          ./security.nix
          # ./greetd.nix
        ];
      };
    }
  ];

  flake.nixosModules = {
    core = import ./system.nix;
    desktop = import ./desktop.nix;
    # gamemode = import ./gamemode.nix;
    # greetd = import ./greetd.nix;
    lanzaboote = import ./lanzaboote.nix;
    # minimal = import ./minimal.nix;
    # network = import ./network.nix;
    nix = import ./nix.nix;
  };
}
