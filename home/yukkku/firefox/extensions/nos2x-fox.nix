{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  nos2x-fox = inputs.nix-firefox-addons.addons.${system}.nos2x-fox;
  guid = "{fdacee2c-bab4-490d-bc4b-ecdd03d5d68a}";
in
{
  programs.firefox = {
    profiles.dev-edition-default.extensions.packages = [ nos2x-fox ];
    policies.ExtensionSettings.${guid}.installation_mode = "normal_installed";
  };
}
