{
  # https://wiki.nixos.org/wiki/Flakes
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {

      # https://ryantm.github.io/nixpkgs/builders/images/dockertools/
      packages.x86_64-linux.default = pkgs.dockerTools.buildImage {
        name = "derper";

        copyToRoot = pkgs.buildEnv {
          name = "image-root";
          paths = [ pkgs.tailscale.derper ];
        };
      };
    };
}
