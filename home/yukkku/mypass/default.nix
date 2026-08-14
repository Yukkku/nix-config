{ ... }: {
  imports = [ ./module.nix ];

  programs.mypass = {
    enable = true;
    config = {
      services = {
        "accounts.google.com" = {
          len = 100;
        };
        "atcoder.jp" = {
          len = 200;
        };
        "bsky.app" = {
          len = 200;
        };
        "discord.com" = {
          len = 72;
        };
        "github.com" = {
          len = 72;
        };
        "ja.scratch-wiki.info" = {
          len = 200;
        };
        "misskey.io" = {
          len = 200;
        };
        "musescore.com" = {
          len = 200;
          requires = [
            "abcdefghijklmnopqrstuvwxyz"
            "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            "0123456789"
            "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
          ];
        };
        "qiita.com" = {
          len = 32;
        };
        "scratch.mit.edu" = {
          len = 200;
        };
        "www.instagram.com" = {
          len = 200;
        };
        "x.com" = {
          len = 128;
        };
      };
    };
  };
}
