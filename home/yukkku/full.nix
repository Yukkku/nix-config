_: {
  imports = [
    ./fonts
    ./gtk
    ./ime
    ./ssh
    ./sway
    ./swaylock
    ./wl-clipboard

    ./codex
    ./firefox
    ./foot
    ./golly
    ./musescore
    ./rofi
    ./turbowarp
    ./zathura

    ./fastfetch
    ./genicon
    ./git
    ./htop
    ./miniserve
    ./mypass
    ./neovim
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  news.display = "silent";
  home.stateVersion = "26.05";
}
