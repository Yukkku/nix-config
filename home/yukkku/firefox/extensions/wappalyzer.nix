{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  wappalyzer = inputs.nix-firefox-addons.addons.${system}.wappalyzer;
  guid = "wappalyzer@crunchlabz.com";
in
{
  programs.firefox = {
    profiles.dev-edition-default = {
      extensions.packages = [ wappalyzer ];
    };
    policies.ExtensionSettings.${guid}.installation_mode = "normal_installed";
  };
}
