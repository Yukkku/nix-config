{ pkgs, lib, ... }:
let
  scripts = map (path: pkgs.callPackage path { }) [
    ./atcoder-problems.nix
    ./github.nix
    ./nix-search.nix
    ./rustdoc.nix
    ./twitter.nix
    ./wikipedia-ja.nix
  ];
  guid = "{29a08fce-484b-4861-831a-ee0dc3d0d625}";
  manifest = {
    manifest_version = 3;
    name = "Custom Scripts";
    version = "0.0.0";
    browser_specific_settings.gecko.id = guid;
    content_scripts = map (
      {
        matches,
        js ? null,
        css ? null,
        ...
      }:
      {
        inherit matches;
        run_at = "document_start";
        js = if js == null then [ ] else [ "${builtins.hashFile "sha256" js}.js" ];
        css = if css == null then [ ] else [ "${builtins.hashFile "sha256" css}.css" ];
      }
    ) scripts;
  };
  addon = pkgs.stdenvNoCC.mkDerivation {
    name = "custom-scripts";
    nativeBuildInputs = [ pkgs.zip ];
    src = pkgs.emptyDirectory;
    installPhase = ''
      echo ${lib.escapeShellArg (builtins.toJSON manifest)} > manifest.json
      ${lib.join "" (
        map (
          {
            js ? null,
            css ? null,
            ...
          }:
          (if js == null then "" else "ln -s ${js} ${builtins.hashFile "sha256" js}.js\n")
          + (if css == null then "" else "ln -s ${css} ${builtins.hashFile "sha256" css}.css\n")
        ) scripts
      )}

      dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
      mkdir -p $dst
      zip "$dst/${guid}.xpi" *
    '';
  };
in
{
  programs.firefox = {
    profiles.dev-edition-default.extensions.packages = [ addon ];
    policies.ExtensionSettings.${guid}.installation_mode = "normal_installed";
  };
}
