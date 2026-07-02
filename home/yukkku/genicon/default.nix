{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  yukkku-genicon = inputs.yukkku-genicon.packages.${system}.default;
in
{
  home.packages = [ yukkku-genicon ];
}
