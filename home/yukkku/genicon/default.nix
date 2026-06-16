{ inputs, system, ... }:
let
  yukkku-genicon = inputs.yukkku-genicon.packages.${system}.default;
in
{
  home.packages = [ yukkku-genicon ];
}
