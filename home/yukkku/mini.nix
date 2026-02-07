_: {
  imports = [
    ./git
    ./neovim
    ./htop
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
