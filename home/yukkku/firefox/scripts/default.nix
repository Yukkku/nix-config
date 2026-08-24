{ pkgs, lib, ... }:
let
  scripts = lib.flatten (
    map (path: import path pkgs) [
      ./atcoder.nix
      ./atcoder-problems.nix
      ./discord.nix
      ./duckduckgo.nix
      ./github.nix
      ./nix-search.nix
      ./qiita.nix
      ./rustdoc.nix
      ./turbowarp.nix
      ./twitter.nix
      ./wikipedia-ja.nix
      ./zenn.nix
    ]
  );
  guid = "{29a08fce-484b-4861-831a-ee0dc3d0d625}";
  manifest = {
    manifest_version = 2;
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
    installPhase =
      let
        files = (
          lib.mergeAttrsList (
            map (
              {
                js ? null,
                css ? null,
                ...
              }:
              (if js == null then { } else { ${"${builtins.hashFile "sha256" js}.js\n"} = js; })
              // (if css == null then { } else { ${"${builtins.hashFile "sha256" css}.css\n"} = css; })
            ) scripts
          )
        );
      in
      ''
        echo ${lib.escapeShellArg (builtins.toJSON manifest)} > manifest.json
        ${lib.concatMapAttrsStringSep "\n" (k: v: "ln -s ${v} ${k}") files}

        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p $dst
        zip "$dst/${guid}.xpi" *
      '';
    passthru.addonId = guid;
  };
in
{
  programs.firefox = {
    profiles.dev-edition-default.extensions.packages = [ addon ];
    policies.ExtensionSettings.${guid}.installation_mode = "normal_installed";
  };
}
