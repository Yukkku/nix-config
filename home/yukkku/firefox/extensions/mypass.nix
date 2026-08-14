{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  mypass-addon = inputs.mypass.packages.${system}.mypass-addon;
  guid = "{0f7e3393-e120-4b1f-9d5c-46ffdfde4195}";
in
{
  programs.firefox = {
    profiles.dev-edition-default.extensions = {
      packages = [ mypass-addon ];
      settings.${guid}.settings = lib.mkIf config.programs.mypass.enable {
        config = config.programs.mypass.config;
      };
    };
    policies.ExtensionSettings.${guid}.installation_mode = "normal_installed";
  };
}
