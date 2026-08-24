_: {
  programs.ssh = {
    enable = true;
    settings = {
      # 初期設定だと学校のwifiがなんかブロックしてgit push/pullできないので
      "github.com" = {
        HostName = "ssh.github.com";
        User = "git";
        Port = 443;
      };
    };
  };
}
