{
  pkgs,
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
  imports = [ ../../mypass ];
  programs.firefox = {
    profiles.dev-edition-default.extensions.packages = [ mypass-addon ];
    policies.ExtensionSettings.${guid}.installation_mode = "normal_installed";
    profiles.dev-edition-default.extensions.settings.${guid} = {
      force = true;
      settings.config = config.programs.mypass.config;
    };
  };
}
