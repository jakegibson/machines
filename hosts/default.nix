{ inputs, withSystem, sharedModules, homeImports, ... }: {
  flake.nixosConfigurations = withSystem "x86_64-linux"
    ({ system, self', inputs', ... }:
      let
        systemInputs = { _module.args = { inherit self' inputs'; }; };
        inherit (inputs.nixpkgs.lib) nixosSystem;
      in {
        ctrlone = nixosSystem {
          inherit system;

          modules = [
            ./ctrlone
            ../modules/desktop.nix
            #../modules/greetd.nix
            ../modules/desktop.nix
            # ../modules/lanzaboote.nix
            {
              home-manager.users.idsix.imports =
                homeImports."idsix@ctrlone";
            }
            systemInputs
          ] ++ sharedModules;
        };
      });
}
