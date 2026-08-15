{ pkgs, ... }:
let
  musescore = pkgs.musescore;
  iniFormat = pkgs.formats.ini { };
  color = import ../color;
in
{
  home.packages = [ musescore ];
  xdg.configFile."MuseScore/MuseScore4.ini" = {
    source = iniFormat.generate "MuseScore4.ini" {
      application = {
        hasCompletedFirstLaunchSetup = true;
        welcomeDialogShowOnStartup = false;
        welcomeDialogLastShownVersion = musescore.version;
        checkForUpdate = false;
      };

      ui = {
        "application\\currentThemeCode" = "dark";
        "application\\followSystemTheme" = true;
        "application\\themes" = builtins.toJSON (
          builtins.toJSON [
            {
              "title" = "Dark";
              "codeKey" = "dark";

              "accentColor" = color.blue.hashHex; # "#2093fe";
              "accentOpacityNormal" = 0.5;
              "accentOpacityHit" = 0.7;
              "accentOpacityHover" = 0.3;

              "backgroundPrimaryColor" = "#73000000"; # "#2d2d30";
              "backgroundSecondaryColor" = "transparent"; # "#363638";
              "backgroundTertiaryColor" = "#000000";
              "backgroundQuarternaryColor" = "#000000";

              "buttonColor" = "#595959";
              "buttonOpacityNormal" = 0.7;
              "buttonOpacityHit" = 1;
              "buttonOpacityHover" = 0.5;

              "focusColor" = "#75507b";

              "fontPrimaryColor" = "#ebebeb";
              "fontSecondaryColor" = "#bdbdbd";

              "itemOpacityDisabled" = 0.3;
              "linkColor" = "#8ec9ff";
              "navigationControlBorderWidth" = 2;
              "playColor" = "#000000";
              "popupBackgroundColor" = "#39393c";
              "projectTabColor" = "#000000";
              "recordColor" = "#000000";

              "strokeColor" = "#1e1e1e";
              "strokeSecondaryColor" = "#000000";
              "borderWidth" = 0;

              "textFieldColor" = "#242427";

              "blackColor" = "#000000";
              "whiteColor" = "#000000";
            }
          ]
        );

        "canvas\\background\\useColor" = false;
        "canvas\\background\\wallpaper" = pkgs.writeText "background.svg" ''<svg viewBox="0 0 1 1"/>'';
      };
    };
  };
}
