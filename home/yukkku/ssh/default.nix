_: {
  programs.ssh = {
    enable = true;
    settings = {
      "github.com" = {
        HostName = "ssh.github.com";
        User = "git";
        Port = 443;
      };
    };
  };
}
