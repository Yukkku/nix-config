_: {
  imports = [
    ./fonts
    ./ime
    ./sway

    ./firefox
    ./foot
    ./musescore
    ./zathura

    ./git
    ./neovim
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
