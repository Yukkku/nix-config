{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [ ../foot ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      input = {
        "type:keyboard" = {
          xkb_model = "jp106";
          xkb_layout = "jp";
        };
      };
      defaultWorkspace = "workspace number 1";
      gaps.inner = 16;
      window.border = 0;
      window.titlebar = false;
      bars = [ ];
      modes.resize = {
        "Escape" = "mode default";
        "Down" = "resize grow height 16 px";
        "Left" = "resize shrink width 16 px";
        "Right" = "resize grow width 16 px";
        "Up" = "resize shrink height 16 px";
        "h" = "resize shrink width 16 px";
        "j" = "resize grow height 16 px";
        "k" = "resize shrink height 16 px";
        "l" = "resize grow width 16 px";
      };

      terminal = lib.getExe config.programs.foot.package;
      menu = "${lib.getExe config.programs.rofi.package} -show run";

      keybindings =
        let
          cfg = config.wayland.windowManager.sway.config;
          mod = cfg.modifier;
        in
        {
          "${mod}+Return" = "exec ${cfg.terminal}";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = "exec ${cfg.menu}";

          "${mod}+${cfg.left}" = "focus left";
          "${mod}+${cfg.down}" = "focus down";
          "${mod}+${cfg.up}" = "focus up";
          "${mod}+${cfg.right}" = "focus right";

          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+${cfg.left}" = "move left";
          "${mod}+Shift+${cfg.down}" = "move down";
          "${mod}+Shift+${cfg.up}" = "move up";
          "${mod}+Shift+${cfg.right}" = "move right";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+f" = "fullscreen toggle";
          "${mod}+a" = "focus parent";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "${mod}+Shift+e" = "exec swaymsg exit";

          "${mod}+x" = "exec ${pkgs.shotman}/bin/shotman -c output";
          "${mod}+c" = "exec ${pkgs.shotman}/bin/shotman -c region";
          "${mod}+Shift+c" = "exec ${pkgs.shotman}/bin/shotman -c window";
        };

      output."*".bg = "${./bg4.jpg} fill";

    };
  };

  xdg = {
    enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
      config.common.default = "*";
    };
  };
}
