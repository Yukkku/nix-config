{ pkgs, ... }:
{
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
      output."*".bg = "${./bg.jpg} fit";
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
