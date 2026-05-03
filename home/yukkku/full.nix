_: {
  imports = [
    ./fonts
    ./ime
    ./sway
    ./swaylock
    ./gtk
    ./wl-clipboard

    ./firefox
    ./foot
    ./musescore
    ./zathura
    ./turbowarp

    ./fastfetch
    ./git
    ./htop
    ./neovim
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  news.display = "silent";
  home.stateVersion = "26.05";
}
