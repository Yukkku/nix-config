_: {
  imports = [
    ./fastfetch
    ./genicon
    ./git
    ./htop
    ./miniserve
    ./mypass
    ./neovim
    ./ssh
    ./tdf
  ];

  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  programs.bash.enable = true;
  programs.home-manager.enable = true;
  news.display = "silent";
  home.stateVersion = "26.05";
}
