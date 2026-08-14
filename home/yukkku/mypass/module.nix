{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.programs.mypass;
  system = pkgs.stdenv.hostPlatform.system;
  mypass-cli = inputs.mypass.packages.${system}.mypass-cli;

  serviceConfigType = lib.types.submodule {
    options = {
      len = lib.mkOption {
        type = lib.types.int;
        default = null;
      };
      allow_chars = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      requires = lib.mkOption {
        type = lib.types.nullOr (lib.types.listOf lib.types.str);
        default = null;
      };
      info = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
    };
  };

  configType = lib.types.submodule {
    options = {
      services = lib.mkOption { type = lib.types.attrsOf serviceConfigType; };
    };
  };

in
{
  options.programs.mypass = {
    enable = lib.mkEnableOption "mypass";
    config = lib.mkOption { type = configType; };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ mypass-cli ];
    xdg.configFile."mypass/config.json" = {
      text = builtins.toJSON {
        services = lib.mapAttrs (_: lib.filterAttrs (_: v: !(isNull v))) cfg.config.services;
      };
    };
  };
}
