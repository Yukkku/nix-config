_: {
  imports = [
    ./fonts
    ./ime
    ./sway
    ./swaylock
    ./gtk

    ./firefox
    ./foot
    ./musescore
    ./zathura

    ./fastfetch
    ./git
    ./htop
    ./neovim
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
