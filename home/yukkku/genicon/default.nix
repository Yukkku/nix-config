{ inputs, pkgs, ... }:
let
  yukkku-genicon = inputs.yukkku-genicon.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  home.packages = [ yukkku-genicon ];
}
