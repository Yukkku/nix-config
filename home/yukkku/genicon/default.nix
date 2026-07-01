{ inputs, pkgs, ... }:
let
  yukkku-genicon = inputs.yukkku-genicon.packages.${pkgs.system}.default;
in
{
  home.packages = [ yukkku-genicon ];
}
