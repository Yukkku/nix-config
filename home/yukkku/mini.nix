_: {
  imports = [
    ./fastfetch
    ./git
    ./htop
    ./neovim
    ./tdf
    ./miniserve
    ./genicon
    ./mypass
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  news.display = "silent";
  home.stateVersion = "26.05";
}
