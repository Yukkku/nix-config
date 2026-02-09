_: {
  imports = [
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
